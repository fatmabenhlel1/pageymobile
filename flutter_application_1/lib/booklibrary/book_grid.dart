import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 11),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            BookCard(
              imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/1101ff1f86b797e96b2ffad97ddf446d65db961e6fb49c0153fbfffcf0fc5330?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
              title: 'Catcher in the Rye',
              author: 'J.D. Salinger',
            ),
            SizedBox(width: 34),
            BookCard(
              imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/6ab7c8dde11b13206af76dbfb11ceb9c157652d2deaa5d282bebcbce152ae5a7?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
              title: 'Someone Like You',
              author: 'Roald Dahl',
            ),
            SizedBox(width: 34),
            BookCard(
              imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/3fcefbbf31c691b1c8e8323ca07bd6de7c5ae63b44ab26caad05525c65504d0f?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
              title: 'Lord of the Rings',
              author: 'J.R.R Tolkein',
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const BookCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D06070D),
                  blurRadius: 14,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: 160,
                height: 250,
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