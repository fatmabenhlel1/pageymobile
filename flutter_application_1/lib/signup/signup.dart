import 'package:flutter/material.dart';
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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                        );
                      },
                    
                      child:const Text(
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
                          // Handle form submission
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Survey()),
                          );
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
