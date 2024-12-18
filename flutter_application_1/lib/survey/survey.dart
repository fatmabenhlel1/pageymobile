import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dropdown_field.dart';
import 'custom_button.dart';
import '../booklibrary/book_reader_screen.dart';


class Survey extends StatelessWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SurveyScreen(),
    );
  }
}

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 23),
            padding: const EdgeInsets.only(top: 32, bottom: 64),
            child: Form(
              child: Column(
                children: [
                  Text(
                    'Pagey',
                    style: GoogleFonts.outfit(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Sign up Survey',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'For a more personalized experience',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48),
                  const DropdownField(
                    label: 'Select your age',
                    hint: 'Age',
                  ),
                  const SizedBox(height: 36),
                  const DropdownField(
                    label: 'Select your gender',
                    hint: 'Gender',
                  ),
                  
                  const SizedBox(height: 36), // Added space for the new dropdown
                  const DropdownField(
                    label: 'Select your favourite book',
                    hint: 'Favourite Book',
                  ),
                  const SizedBox(height: 48),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF333333),
                      ),
                      children: const [
                        TextSpan(text: 'By continuing, you agree to the '),
                        TextSpan(
                          text: 'Terms of use',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF111111),
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF111111),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Updated button with smaller font size
                  CustomButton(text: 'Continue',
                              onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BookReaderScreen()),);}, 
                              fontSize: 14),
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
