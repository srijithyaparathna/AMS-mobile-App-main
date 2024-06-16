import 'package:appointmentms/widgets/AfterLoginAppBar.dart';
import 'package:appointmentms/widgets/AfterStaffSignUpBottom.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaffLoginHome extends StatefulWidget {
  const StaffLoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<StaffLoginHome> {
  String? storedEmail;

  @override
  void initState() {
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AfterLoginAppBar(),
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
      bottomNavigationBar: AfterStaffLoginBottomNavigation(),
    );
  }
}
