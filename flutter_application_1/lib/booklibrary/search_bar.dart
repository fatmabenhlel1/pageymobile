import 'package:flutter/material.dart';

class SearchB extends StatelessWidget {
  const SearchB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x26C4C4C4),
      ),
      child: Row(
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/a18051ccf32de00270fe1aef4645ce4e8e4769050c093def302bcad982fd117d?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          const Expanded(
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