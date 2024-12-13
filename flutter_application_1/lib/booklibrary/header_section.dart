import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 388),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/35a18595eae5e2ec6737c6770dccc9d1056a5cbddf03b4238958ea1bd6c396f0?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                'Pagey',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://cdn.builder.io/api/v1/image/assets/TEMP/f008122c0cd5459518bc37b8a1784409c3637f1edcdbe84bcd01c6ea2befea4b?placeholderIfAbsent=true&apiKey=c06234bf7af94025a702ef198e05be67'),
          ),
        ],
      ),
    );
  }
}