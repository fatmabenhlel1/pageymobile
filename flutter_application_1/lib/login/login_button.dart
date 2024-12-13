import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/homepage.dart';
class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2C3E50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 70,
          vertical: 16,
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}