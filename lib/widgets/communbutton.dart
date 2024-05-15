
// signup_button.dart
import 'package:flutter/material.dart';

class Buttons2 extends StatelessWidget {
  final double? width;
  final bool isResponsive;
  final String text;
  final VoidCallback? onPressed;

  const Buttons2({
    Key? key,
    this.width,
    this.isResponsive = false,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(width ?? 115.0, 50.0), 
        backgroundColor: const Color(0xFF500512),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

