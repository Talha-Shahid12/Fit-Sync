import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class diet_rec extends StatefulWidget {
  @override
  _diet_rec createState() => _diet_rec();
}

class _diet_rec extends State<diet_rec> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mealsController = TextEditingController();
  String? activityLevel; // Set to null initially
  double? weightPlan; // Set to null initially
  String predictedCalories = '';

  // Map to convert weight loss plan strings to float values
  Map<String, double> weightPlanValues = {
    'Maintain Weight': 1.0,
    'Mild Weight Loss': 0.9,
    'Weight Loss': 0.8,
    'Extreme Weight Loss': 0.7,
  };

  Future<void> fetchDataAndPredict() async {
    final url = 'http://192.168.36.234/diet_recommendation';
    // Sample input data for prediction
    Map<String, dynamic> inputData = {
      'age': int.parse(ageController.text),
      'height': int.parse(heightController.text),
      'weight': int.parse(weightController.text),
      'gender': genderController.text,
      'activity': activityLevel!,
      'weight_loss': weightPlan!,
      'meals_calories_perc': mealsController
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
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: activityLevel,
                  dropdownColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Activity Level',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      activityLevel = newValue!;
                    });
                  },
                  items: [
                    'Little/no exercise',
                    'Light exercise',
                    'Moderate exercise (3-5 days/wk)',
                    'very active (6-7 days/wk)',
                    'Extra active (very active & physical job)'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: weightPlan != null ? weightPlanValues.keys.firstWhere((key) => weightPlanValues[key] == weightPlan) : null,
                  dropdownColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Weight Loss Plan',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      weightPlan = weightPlanValues[newValue!]!;
                    });
                  },
                  items: weightPlanValues.keys.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                  controller: mealsController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Meals Per Day',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                fetchDataAndPredict();
              },
              child: Text('See Magic'),
            ),
          ],
        ),
      ),
    );
  }
}
