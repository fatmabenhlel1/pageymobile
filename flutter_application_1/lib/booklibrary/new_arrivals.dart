import 'package:flutter/material.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'New Arrivals',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF19191B),
            ),
          ),
        ),
        const SizedBox(height: 19),
        Center(
          child: Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/01be2d45523f9ed426ab5cc9bceb53c9ef60f299284abfb36207924ef07e784c?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
            width: 369,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}