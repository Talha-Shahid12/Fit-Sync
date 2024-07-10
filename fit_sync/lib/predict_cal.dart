// ignore_for_file: prefer_const_declarations, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'about_dev.dart';
import 'custom_food_recomendation.dart';


class predict_calories extends StatefulWidget {
  @override
  _predict_calories createState() => _predict_calories();
}

class _predict_calories extends State<predict_calories> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  String predictedCalories = '';

Future<void> fetchDataAndPredict() async {
    final url = 'http://192.168.36.234:3355/predict_calories'; 
    // Sample input data for prediction
    Map<String, dynamic> inputData = {
      'age': int.parse(ageController.text),
      'height': int.parse(heightController.text),
      'weight': int.parse(weightController.text),
      'sex': genderController.text
    };

    // Make POST request to the backend
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(inputData),
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the response body
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      
      // Extract the predicted calories from the response
      setState(() {
        predictedCalories = responseBody['predicted_calories'].toString();
      });
    } else {
      // Handle the error if request fails
      print('Failed to fetch data. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        //backgroundColor: Color.fromARGB(255, 230, 199, 199),
        title: Text('Calories Prediction', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
              
              index: 0,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.fastfood, size: 30),
                // Icon(Icons.list, size: 30), // Remove the List icon
                Icon(Icons.restaurant, size: 30),
                Icon(Icons.home, size: 30),
                // Icon(Icons.call_split, size: 30), // Remove the Call Split icon
                  Icon(Icons.developer_board, size: 30),

              ],
              color: Color.fromARGB(255, 117, 186, 243), 
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.black,
              animationCurve: Curves.linear,
              animationDuration: Duration(milliseconds: 400),
              onTap: (index) {
                if (index == 1)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodRecommendation()),
                  );
                  if (index == 2)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FitSyncScreen()),
                  );
                  if (index == 3)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminPage()),
                  );

             
              },
              letIndexChange: (index) => true,
            ),
      //backgroundColor: Color.fromARGB(255, 230, 199, 199),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Text(
              'Enter Data',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: genderController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              
              onPressed: () {
                fetchDataAndPredict();();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PredictedCaloriesDialog(predictedCalories: predictedCalories);
                  },
                );
              },
              child: Text('See Magic'),
            ),
            // SizedBox(height: 16),
            // Text(
            //   predictedCalories,
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}




class PredictedCaloriesDialog extends StatelessWidget {
  final String predictedCalories;

  const PredictedCaloriesDialog({Key? key, required this.predictedCalories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                color: Colors.green,
                size: 48.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Predicted Calories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                predictedCalories,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
