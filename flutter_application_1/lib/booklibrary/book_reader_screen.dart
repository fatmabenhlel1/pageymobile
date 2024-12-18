import 'package:flutter/material.dart';
import 'header_section.dart';
import 'welcome_section.dart';
import 'search_bar.dart';
import 'category_list.dart';
//import 'book_grid.dart';
import 'new_arrivals.dart';

class BookReaderScreen extends StatelessWidget {
  const BookReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 17, 0, 17),
          constraints: const BoxConstraints(maxWidth: 480),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              SizedBox(height: 63),
              WelcomeSection(),
              SizedBox(height: 34),
              SearchB(),
              SizedBox(height: 34),
              CategoryList(),
              SizedBox(height: 30),
              NewArrivals(),
            ],
          ),
        ),
      ),
    );
  }
}