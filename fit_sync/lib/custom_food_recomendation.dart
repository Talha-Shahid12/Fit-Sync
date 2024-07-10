// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'predict_cal.dart';
import 'about_dev.dart';
class FoodRecommendation extends StatefulWidget {
  @override
  _FoodRecommendationState createState() => _FoodRecommendationState();
}

class _FoodRecommendationState extends State<FoodRecommendation> {
  List<double> testInput = List.filled(9, 0);
  int ingredientCount = 1;
  List<String> ingredientArr = [];
  List<dynamic> recommendations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Food Recommendation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
    bottomNavigationBar: CurvedNavigationBar(
              
              index: 1,
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
                if (index == 0)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => predict_calories()),
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [SizedBox(width: 20,), Text('Calories', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[0].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[0],
                min: 0,
                max: 2000,
                onChanged: (value) {
                  setState(() {
                    testInput[0] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(children: [SizedBox(width: 20,), Text('FatContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[1].toInt()}', style: TextStyle(color: Colors.white),),]),
              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[1],
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    testInput[1] = value;
                  });
                },
              ),

              SizedBox(height: 20.0),
              Row(children: [SizedBox(width: 20,), Text('SaturatedFatContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[2].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[2],
                min: 0,
                max: 13,
                onChanged: (value) {
                  setState(() {
                    testInput[2] = value;
                  });
                },
              ),

              SizedBox(height: 20.0),
              Row(children: [SizedBox(width: 20,), Text('CholestrolContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[3].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[3],
                min: 0,
                max: 300,
                onChanged: (value) {
                  setState(() {
                    testInput[3] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(children: [SizedBox(width: 20,), Text('SodiumContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[4].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[4],
                min: 0,
                max: 2300,
                onChanged: (value) {
                  setState(() {
                    testInput[4] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
             Row(children: [SizedBox(width: 20,), Text('CarbohydrateContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[5].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[5],
                min: 0,
                max: 325,
                onChanged: (value) {
                  setState(() {
                    testInput[5] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
             Row(children: [SizedBox(width: 20,), Text('FiberContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[6].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[6],
                min: 0,
                max: 40,
                onChanged: (value) {
                  setState(() {
                    testInput[6] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
             Row(children: [SizedBox(width: 20,), Text('SugarContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[7].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[7],
                min: 0,
                max: 40,
                onChanged: (value) {
                  setState(() {
                    testInput[7] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(children: [SizedBox(width: 20,), Text('ProteinContent', style: TextStyle(color: Colors.white),)],),
              Row( mainAxisAlignment: MainAxisAlignment.center, children:[Text('${testInput[8].toInt()}', style: TextStyle(color: Colors.white),),]),

              Slider(
                activeColor: Color.fromARGB(255, 117, 186, 243),
                value: testInput[8],
                min: 0,
                max: 40,
                onChanged: (value) {
                  setState(() {
                    testInput[8] = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              for (int i = 0; i < ingredientCount; i++)
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      final ingredient = value.toLowerCase(); 
                      if (i < ingredientArr.length) {
                        ingredientArr[i] = ingredient;
                      } else {
                        ingredientArr.add(ingredient);
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Ingredient',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              SizedBox(height: 10.0),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: sendRequestToBackend,
                child: Text('Generate'),
                
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(10.0),
                color: const Color.fromARGB(255, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text('Recommended Recipes', style: TextStyle(color: Colors.white
                    ,fontSize: 25.0, fontWeight: FontWeight.bold)),]),
                    SizedBox(height: 10.0),
                    for (var recipe in recommendations)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Recipe Name: ${recipe['Name']}', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Text('Cook Time: ${recipe['CookTime']} min',style:TextStyle(color: Colors.white,)),
                          Text('Prep Time: ${recipe['PrepTime']} min',style:TextStyle(color: Colors.white,)),
                          // Display other recipe details as needed...
                          Divider(),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendRequestToBackend() async {
  final url = Uri.parse('http://192.168.36.234:5656/recommend');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'nutrition_input': testInput,
    'ingredients': ingredientArr,
    'params': {
      'n_neighbors': 5,
    },
  });

  try {
    print('sending...');
    final response = await http.post(url, headers: headers, body: body);
    print('sent');
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
      setState(() {
        recommendations = responseData['output']; // Change 'output' to 'recommendations'
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending request: $e');
  }
}

}

