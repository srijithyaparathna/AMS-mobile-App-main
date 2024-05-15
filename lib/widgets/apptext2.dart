import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargeText2 extends StatelessWidget {
  double size;
  final String text;
  final Color color;
   AppLargeText2({Key? key, 
    this.size =30,
    required this.text,
    this.color = Colors.black}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          
          color: Color(0xFF500512),
          fontSize: 35,
          fontWeight: FontWeight.bold,
          
        ),
      
      ),
    );
  }
}