import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 65,
        child: BottomNavigationBar(
          
          backgroundColor: const Color(0xFFA1CCEB),
          
          
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home, color:Color(0xFF500512)),
            ),
            BottomNavigationBarItem(
              label: 'My Appointments',
              icon: Icon(Icons.book, color:Color(0xFF500512)),
            ),
            BottomNavigationBarItem(
              label: 'Time Table',
              icon: Icon(Icons.calendar_today, color:Color(0xFF500512)),
            ),
          ],
          
        ),
      ),
    );
  }
}