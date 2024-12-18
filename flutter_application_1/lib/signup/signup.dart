import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For HTTP requests
import 'package:fluttertoast/fluttertoast.dart'; // For toast notifications
import 'custom_text_field.dart';
import 'auth_button.dart';
import '../homescreen.dart';
import '../survey/survey.dart';


class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to send registration request
  Future<void> _registerUser() async {
    const String baseUrl = 'https://1201-196-203-181-122.ngrok-free.app/api'; // Replace with your server URL
    final Uri url = Uri.parse('$baseUrl/auth/register');

    final String name = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        // Successfully registered
        final responseData = json.decode(response.body);
        print('Registration successful: $responseData');
        showToast('Registration successful!'); // Show success message

        // Navigate to the survey page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Survey()),
        );
      } else {
        // Handle errors (e.g., email already in use)
        final responseData = json.decode(response.body);
        final errorMessage = responseData['error'] ?? 'Registration failed';
        showToast(errorMessage, isError: true); // Show error message
      }
    } catch (e) {
      // Handle network or other errors
      print('Error during registration: $e');
      showToast('An error occurred. Please try again.', isError: true); // Show error message
    }
  }

  // Function to show toast messages
void showToast(String message, {bool isError = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT, // Show toast for a short duration
    gravity: ToastGravity.BOTTOM, // Position at the bottom of the screen
    backgroundColor: isError ? Colors.red : Colors.green, // Color based on error status
    textColor: Colors.white, // Text color
    fontSize: 16.0, // Font size
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
            padding: const EdgeInsets.fromLTRB(36, 32, 36, 116),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                        );
                      },
                      child: const Text(
                        'Pagey',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Outfit',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 41),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle login navigation
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  CustomTextField(
                    controller: _usernameController,
                    label: 'User name',
                    semanticsLabel: 'Enter your username',
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    semanticsLabel: 'Enter your email address',
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xCC666666),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _obscurePassword ? 'Show' : 'Hide',
                                  style: const TextStyle(
                                    color: Color(0xCC666666),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      CustomTextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        semanticsLabel: 'Enter your password',
                      ),
                    ],
                  ),
                  const SizedBox(height: 101),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'By creating an account, you agree to our\n',
                        ),
                        TextSpan(
                          text: 'Terms of use',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 58),
                  Center(
                    child: AuthButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _registerUser(); // Call the registration method
                        }
                      },
                      label: 'Create an account',
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
