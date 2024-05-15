import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';

class DEIE extends StatefulWidget {
  const DEIE({super.key});

  @override
  State<DEIE> createState() => _DEIEState();
}

class _DEIEState extends State<DEIE> {
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
              Column(
                children: [
                  const SizedBox(height: 50.0),
                  AppLargeText3(text: "Department of Electrical &"),
                  AppLargeText3(text: "Information Engineering"),
                ],
              ),
                const SizedBox(width  : 50.0),
             
            ],
          ),
        ),
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(),
    );
  }
}