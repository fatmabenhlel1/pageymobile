import 'package:flutter/material.dart';
import 'header_section.dart';
import 'welcome_section.dart';
import 'search_bar.dart';
import 'category_list.dart';
import 'book_list.dart';
import 'new_arrivals.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(231, 235, 239, 0.73),
              Color.fromRGBO(247, 236, 207, 0.73),
              Color.fromRGBO(246, 235, 207, 0.73),
            ],
            stops: [0.154, 0.509, 0.829],
          ),
        ),
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(),
                  SizedBox(height: 63),
                  WelcomeSection(),
                  SizedBox(height: 34),
                  SearchBarWidget(),
                  SizedBox(height: 42),
                  CategoryList(),
                  BookList(),
                  SizedBox(height: 30),
                  NewArrivals(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
