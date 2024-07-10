// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:fit_sync/custom_food_recomendation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'predict_cal.dart';
class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the icon color here
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'About Developer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
            bottomNavigationBar: CurvedNavigationBar(
              
              index: 3,
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

             
              },
              letIndexChange: (index) => true,
            ),
            backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            buildAdminCard(
              'Ahsan Ashraf',
              '21K-3186',
              'k213186@nu.edu.pk',
              'assets/images/ahsan.jpg',
            ),
            SizedBox(height: 10),
            buildAdminCard('Talha Shahid', '21K-3355', 'k213355@nu.edu.pk',
                'assets/images/talha.jpeg'),
                SizedBox(height: 10),
                buildAdminCard(
              'Kantesh Kumar',
              '21K-3426',
              'k213426@nu.edu.pk',
              'assets/images/kantesh.JPG',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildAdminCard(
      String name, String rollNumber, String email, String imagePath) {
    return Card(
      color: Color.fromARGB(92, 245, 245, 245),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(height: 8),
            Text(
              'Roll Number: $rollNumber',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}