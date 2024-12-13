import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'login_button.dart';
import 'divider_text.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Outfit',
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
                    onChanged: (value) {},
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Your password',
                    onChanged: (value) {},
                    isPassword: true,
                    isPasswordVisible: _isPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
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
                        // Perform login action
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
                          // Handle "Forget your password"
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
