import 'package:appointmentms/pages/SignUp%20L/lectureSignUp2.dart';
import 'package:appointmentms/pages/SignUp%20L/lectureSignUp3.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/googleButton.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class LecturerSignUp extends StatefulWidget {
  const LecturerSignUp({Key? key}) : super(key: key);

  @override
  State<LecturerSignUp> createState() => _LecturerSignUpState();
}

class _LecturerSignUpState extends State<LecturerSignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Center(child: AppLargeText2(text: "SIGN UP")),
            SizedBox(height: 25.0),
            TextBox(labelText: "Email", width: 390, height: 40),
            SizedBox(height: 25.0),
            TextBox(labelText: "Password", width: 390, height: 40),
            SizedBox(height: 25.0),
            Buttons(text: "CONTINUE", onPressed: () { 
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LecturerSignUp3(), // Replace with your actual destination
      ),
    );
             },),
            SizedBox(height: 25.0),
            AppLargeText(text: "Or"),
            SizedBox(height: 25.0),
            GButton(onPressed: () { 
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LecturerSignUp2(), // Replace with your actual destination
      ),
    );
             },),    
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
