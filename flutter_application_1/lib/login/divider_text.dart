import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;

  const DividerText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: const Color(0x40666666),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            color: const Color(0x40666666),
          ),
        ),
      ],
    );
  }
}