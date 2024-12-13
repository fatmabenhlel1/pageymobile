import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome back, Bunny!',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF9D9D9D),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'What do you want to read today?',
          style: TextStyle(
            fontSize: 26,
            color: Color(0xFF19191B),
            fontWeight: FontWeight.w500,
            height: 1.38,
          ),
        ),
      ],
    );
  }
}