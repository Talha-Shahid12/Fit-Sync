// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'single_handed_curl.dart';
import 'dead_lift.dart';
import 'reverse_fly.dart';
import 'pushups_count.dart';
import 'barbell_curl.dart';
import 'predict_cal.dart';
import 'about_dev.dart';
import 'custom_food_recomendation.dart';
class FitSyncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
                    color: Colors.white, // Set the icon color here
                  ),
        title: Row(children :[
          Text('Fit Sync', style: TextStyle(color: Colors.white, fontSize: 30),),]),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: CurvedNavigationBar(
              
              index: 2,
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
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Row(children: [
          Text(
            '  Master your body alignment',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Times New Roman'
            ),
          ),
          ]),
          SizedBox(height: 20),
          // Add the image here
          Image.asset(
            'assets/images/align1.png',
            width: 520,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Row(children: [          
            Text('  Align Your Body', style: TextStyle(color: Colors.white, fontSize: 25,
            fontWeight: FontWeight.bold, fontFamily: 'Times New Roman'),),
          ],),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => single_handed_curl()),
                  );
                },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/img1.png'),
              ),),
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => reverse_fly()),
                  );
                },
              child:Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/rf.png'),
              ),),
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => barbell_curl()),
                  );
                },
              child:Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/bar_curl.png'),
              ),),
             
            ],
          ),
          SizedBox(height: 20),
          Row(children: [          
            Text('  Lets Finish Workout', style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),),
],),
SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => single_handed_curl()),
                  );
                },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/s_h_curl.png'),
              ),
              ),
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pushup_count()),
                  );
                },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/pu.png'),
              ),
              ),
              InkWell(
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dead_lift()),
                  );
                },
                child:Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(    
                  color: Color.fromARGB(255, 117, 186, 243),              
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset('assets/images/dl.png'),
              ),
              )
             
            ],
          ),
          SizedBox(height: 20),
        ],
      ),)
    );
  }
}
