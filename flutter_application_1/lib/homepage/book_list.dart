import 'package:flutter/material.dart';
import '../bookprofile/BookDetailsScreen.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 359,
      margin: const EdgeInsets.only(top: 35),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(
                    
                  ),
                ),
              );
            },
            child: const BookItem(
              image: 'images/CR.png',
              title: 'Catcher in the Rye',
              author: 'J.D. Salinger',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(
                    
                  ),
                ),
              );
            },
            child: const BookItem(
              image: 'images/rd.jpg',
              title: 'Someone Like You',
              author: 'Roald Dahl',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(
                    
                  ),
                ),
              );
            },
            child: const BookItem(
              image: 'images/lor.jpg',
              title: 'Lord of the Rings',
              author: 'J.R.R Tolkein',
            ),
          ),
        ],
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;

  const BookItem({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF06070D).withOpacity(0.05),
                  blurRadius: 14,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF19191B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            author,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9D9D9D),
            ),
          ),
        ],
      ),
    );
  }
}


