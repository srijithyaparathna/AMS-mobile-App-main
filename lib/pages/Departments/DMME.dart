import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';

class DMME extends StatefulWidget {
  const DMME({super.key});

  @override
  State<DMME> createState() => _DMMEState();
}

class _DMMEState extends State<DMME> {
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
                  AppLargeText3(text: "Department of Mechanicalcal &"),
                  AppLargeText3(text: "Manufacturing Engineering"),
                ],
              ),
                const SizedBox(width  : 50.0),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                'assets/mech.jpg', // Replace with your image path
                height: 65.0,
                width: 65.0,
                            ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(),
    );
  }
}