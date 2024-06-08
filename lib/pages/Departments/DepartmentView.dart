import 'package:flutter/material.dart';
import 'package:appointmentms/pages/Departments/Computer.dart';
import 'package:appointmentms/pages/Departments/DCEE.dart';
import 'package:appointmentms/pages/Departments/DEIE.dart';
import 'package:appointmentms/pages/Departments/DMME.dart';
import 'package:appointmentms/pages/Departments/Marine.dart';
import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/app_largetext.dart';

class DepartmentView extends StatefulWidget {
  const DepartmentView({Key? key}) : super(key: key);

  @override
  _DepartmentViewState createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  String dropdownValue = 'Choose Role'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFFA1CCEB),
          leading: Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 28),
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
                    SizedBox(width: 75.0),
                    TextButton(
                      onPressed: () => _showMenu(context),
                      child: const Text(
                        'DEPARTMENTS',
                        style: TextStyle(
                          color: Color(0xFF500512),
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
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
            AppLargeText(text: "APPOINTMENT MANAGEMENT"),
            AppLargeText(text: "SYSTEM"),
            AppLargeText(text: "FACULTY OF ENGINEERING"),
            const Image(image: AssetImage("assets/image.jpg"), height: 350, width: 350),
          ],
        ),
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(),
    );
  }

  void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'DEIE',
          child: AppLargeText3(text: "DEIE"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'COMPUTER',
          child: AppLargeText3(text: "COMPUTER"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'DCEE',
          child: AppLargeText3(text: "DCEE"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'DMME',
          child: AppLargeText3(text: "DMME"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'MENA',
          child: AppLargeText3(text: "MENA"), // You can customize the appearance here
        ),
      ],
    );

    if (result != null) {
      // Handle the selected value (result) here

      // Navigate based on the selected role
      if (result == 'DEIE') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DEIE(),
          ),
        );
      } else if (result == 'COMPUTER') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => COM(),
          ),
        );
      } else if (result == 'DCEE') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DCEE(),
          ),
        );
      } else if (result == 'DMME') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DMME(),
          ),
        );
      } else if (result == 'MENA') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Marine(),
          ),
        );
      }
    }
  }
}
