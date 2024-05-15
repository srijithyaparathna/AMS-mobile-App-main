import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarcommon(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
             AppLargeText(text: "APPOINTMENT MANAGEMENT"),
             AppLargeText(text: "SYSTEM"),
             AppLargeText(text: "FACULTY OF ENGINEERING"),
            const Image(image: AssetImage("assets/image.jpg"), height: 350, width: 350),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
