import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x26C4C4C4),
      ),
      child: Row(
        children: [
          
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color(0xFFC4C4C4),
                  fontSize: 16,
                  letterSpacing: -0.41,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}