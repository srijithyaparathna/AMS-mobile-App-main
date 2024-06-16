import 'package:appointmentms/pages/Departments/DepartmentView.dart';
import 'package:appointmentms/pages/Login%20S/LoginHome.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/pages/StaffMyappoinment.dart';

class AfterStaffLoginBottomNavigation extends StatefulWidget {
  const AfterStaffLoginBottomNavigation({Key? key}) : super(key: key);

  @override
  State<AfterStaffLoginBottomNavigation> createState() => _AfterStaffLoginBottomNavigationState();
}

class _AfterStaffLoginBottomNavigationState extends State<AfterStaffLoginBottomNavigation> {
 
  int _currentIndex = 0;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomNavigationBar(
        
        backgroundColor: const Color(0xFFA1CCEB),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, color: Color(0xFF500512)),
          ),
         
          BottomNavigationBarItem(
            label: 'My appointments',
            icon: Icon(Icons.list_alt_sharp, color: Color(0xFF500512)),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
      case 0:
        // Navigate to the Home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginHome()),
        );
        break;
      
      case 1:
        // Navigate to the Contact Us page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StaffMyappointment()),
        );
        break;
    }
        },
      ),
    );

    
  }
}
