import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      constraints: const BoxConstraints(maxWidth: 292),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome back, Bunny!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9D9D9D),
            ),
          ),
          Text(
            'What do you want to read today?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Color(0xFF19191B),
              height: 1.38,
            ),
          ),
        ],
      ),
    );
  }
}