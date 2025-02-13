import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

class LiveCameraScreen extends StatefulWidget {
  @override
  _LiveCameraScreenState createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    return _controller.initialize();
  }

  Future<void> _sendImageToBackend(Uint8List bytes) async {
    // Make HTTP POST request to the backend API
    var apiUrl = 'http://192.168.233.231:3355/count_pushups';
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({'img': base64Encode(bytes), 'lmList': 'your-lmList-data'});

    var response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    // Parse the response and update the count
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        count = data['count'] ?? 0; // Update the count received from the server
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isInitialized) {
            // Start a loop to continuously capture frames and send them to the backend
            Timer.periodic(Duration(seconds: 1), (timer) async {
              XFile? file = await _controller.takePicture();
              Uint8List bytes = await file.readAsBytes();
              _sendImageToBackend(bytes);
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Count: $count',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LiveCameraScreen(),
  ));
}
