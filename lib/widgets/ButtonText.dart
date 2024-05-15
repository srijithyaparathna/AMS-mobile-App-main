import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargeText3 extends StatelessWidget {
  double size;
  final String text;
  final Color color;
   AppLargeText3({Key? key, 
    this.size =30,
    required this.text,
    this.color = Colors.black}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        
        color: Color(0xFF500512),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
      ),

    );
  }
}