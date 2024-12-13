import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Novel',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF19191B),
                ),
              ),
              SizedBox(width: 30),
              Text(
                'Self-love',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9D9D9D),
                ),
              ),
              SizedBox(width: 30),
              Text(
                'Science',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9D9D9D),
                ),
              ),
              SizedBox(width: 30),
              Text(
                'Romance',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9D9D9D),
                ),
              ),
              SizedBox(width: 30),
              Text(
                'Crime',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9D9D9D),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: 44,
            height: 2,
            color: const Color(0xFFD45555),
          ),
        ],
      ),
    );
  }
}