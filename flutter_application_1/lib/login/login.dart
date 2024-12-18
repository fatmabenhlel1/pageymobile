import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For HTTP requests
import 'package:fluttertoast/fluttertoast.dart'; // For toast notifications
import 'custom_text_field.dart';
import 'login_button.dart';
import 'divider_text.dart';
import '../booklibrary/book_reader_screen.dart'; // Import BookReaderScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to send login request
  Future<void> _loginUser() async {
    const String baseUrl = 'https://999b-196-203-181-122.ngrok-free.app/api'; // Replace with your backend URL
    final Uri url = Uri.parse('$baseUrl/auth/login'); // Adjust this endpoint to your backend's login route

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Debugging: Print the values to check if they're correct
    print('Email: $email');
    print('Password: $password');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      // Debugging: Check the response status and body
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Check if the response status code is 200 (success)
      if (response.statusCode == 200) {
        showToast('Login successful!');

        // Navigate to BookReaderScreen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BookReaderScreen()),
        );
      } else {
        // Handle invalid credentials or other errors
        showToast('Incorrect email or password', isError: true);
      }
    } catch (e) {
      // Handle network or other errors
      print('Error during login: $e');
      showToast('An error occurred. Please try again.', isError: true); // Show error message
    }
  }

  // Function to show toast messages
  void showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Pagey',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 73),
                  CustomTextField(
                    label: 'Email or mobile phone number',
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      // Set the value of the emailController to the new value
                      _emailController.text = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Your password',
                    controller: _passwordController,
                    isPassword: true,
                    isPasswordVisible: _isPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    onChanged: (value) {
                      _passwordController.text = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                      ),
                      children: [
                        TextSpan(text: 'By continuing, you agree to the '),
                        TextSpan(
                          text: 'Terms of Use',
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
                  const SizedBox(height: 20),
                  LoginButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginUser(); // Call the login method
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle "Other issue with sign-in"
                        },
                        child: const Text(
                          'Other issue with sign in',
                          style: TextStyle(fontSize: 12, color: Color(0xFF111111)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle "Forgot your password"
                        },
                        child: const Text(
                          'Forgot your password',
                          style: TextStyle(fontSize: 12, color: Color(0xFF111111)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const DividerText(text: 'New to our community'),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to the Create Account page
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      side: const BorderSide(color: Color(0xFF111111)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF111111),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
