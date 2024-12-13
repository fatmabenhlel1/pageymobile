import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize; // Added fontSize parameter
  final VoidCallback onPressed; // Added onPressed callback

  const CustomButton({
    Key? key,
    required this.text,
    this.fontSize = 20, // Default font size
    required this.onPressed, // Require onPressed to define behavior
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the onPressed callback when tapped
      child: Container(
        width: 183,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 45),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: fontSize, // Use the fontSize parameter here
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
