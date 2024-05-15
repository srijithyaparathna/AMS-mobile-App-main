
import 'package:appointmentms/widgets/AfterLoginAppBar.dart';
import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AfterLoginAppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            //SizedBox(height: 0.0),
            AppLargeText(text: "APPOINTMENT MANAGEMENT"),
            AppLargeText(text: "SYSTEM"),
            AppLargeText(text: "FACULTY OF ENGINEERING"),
            const Image(image: AssetImage("assets/image.jpg"), height: 350, width: 350),
          ],
        ),
      ),
      bottomNavigationBar:  AfterLoginBottomNavigation(),
    );
  }  
}
