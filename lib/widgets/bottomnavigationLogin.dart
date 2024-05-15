import 'package:appointmentms/pages/CalenderViews/calenderpage.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/pages/contactpage.dart';
import 'package:appointmentms/pages/homepage.dart';

class BottomNavigation2 extends StatefulWidget {
  const BottomNavigation2({Key? key}) : super(key: key);

  @override
  State<BottomNavigation2> createState() => _BottomNavigation2State();
}

class _BottomNavigation2State extends State<BottomNavigation2> {
 
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
            icon: Icon(Icons.home_outlined, color: Color(0xFF500512)),
          ),
          BottomNavigationBarItem(
            label: 'Calender',
            icon: Icon(Icons.calendar_today_outlined, color: Color(0xFF500512)),
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: Icon(Icons.person, color: Color(0xFF500512)),
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
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        // Navigate to the Calendar page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalenderPage()),
        );
        break;
      case 2:
        // Navigate to the Contact Us page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactUs()),
        );
        break;
    }
        },
      ),
    );

    
  }
}
