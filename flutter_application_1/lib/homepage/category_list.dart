import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(text: 'Novel', isSelected: true),
          CategoryItem(text: 'Self-love'),
          CategoryItem(text: 'Science'),
          CategoryItem(text: 'Romance'),
          CategoryItem(text: 'Crime'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryItem({
    Key? key,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? const Color(0xFF19191B) : const Color(0xFF9D9D9D),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}