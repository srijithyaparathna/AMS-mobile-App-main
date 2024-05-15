

import 'package:appointmentms/pages/CalenderViews/DailyView.dart';
import 'package:appointmentms/pages/CalenderViews/MonthlyView.dart';
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/pages/homepage.dart';
import 'package:appointmentms/pages/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
   
    return MaterialApp(
      title: 'Blank Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      home:  HomePage(),
         );
  }
}


