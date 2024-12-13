import 'package:flutter/material.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New Arrivals',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF19191B),
          ),
        ),
        const SizedBox(height: 19),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/new_arrivals.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}