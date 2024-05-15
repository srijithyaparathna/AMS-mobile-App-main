// homepage.dart
import 'package:appointmentms/pages/Login/Lecturer_login.dart';
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/loginbutton.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Choose Role'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFFA1CCEB),
           leading: Padding(
            padding: const EdgeInsets.only(left: 4.0,top: 28), 
          ),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 32, left: 10),
                child: Image.asset(
                  'assets/imag.png',
                  height: 85.0,
                  width: 131.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 100.0),
                    LoginButton(),
                    
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
      bottomNavigationBar:  BottomNavigation2(),
    );
  }

  void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'Lecturer',
          child:  AppLargeText3(text: "STAFF"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'Student',
          child: AppLargeText3(text: "STUDENT"), // You can customize the appearance here
        ),
      ],
    );

    if (result != null) {
    // Handle the selected value (result) here
    

    // Navigate based on the selected role
    if (result == 'Lecturer') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  LectureLogin(), 
        ),
      );
    } else if (result == 'Student') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentLogin(), 
        ),
      );
    }
  }
}
}