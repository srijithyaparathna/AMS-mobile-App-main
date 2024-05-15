
import 'package:appointmentms/pages/SignUp%20S/studentpasswordResetVerify.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class StudentpasswordReset1 extends StatefulWidget {
  const StudentpasswordReset1({Key? key}) : super(key: key);

  @override
  State<StudentpasswordReset1> createState() => _passwordReset1State();
}

class _passwordReset1State extends State<StudentpasswordReset1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Center(child: AppLargeText2(text: "RESET PASSWORD")),
            SizedBox(height: 50.0),
            TextBox(labelText: "University Email", width: 390, height: 40),
            SizedBox(height: 60.0),
            Buttons(text: "CONTINUE", onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentpasswordResetVerify(), // Replace with your actual destination
                ),
              );
             },),
            
            SizedBox(height: 20.0),
            
             
             
            
        
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
