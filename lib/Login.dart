import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:new_chilla/CreateAccount.dart';
import 'package:new_chilla/Error.dart';
import 'package:new_chilla/dashboard.dart';
import 'package:new_chilla/design.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    const String url =
        'http://104.237.9.211:8007/karuthal/api/v1/usermanagement/login';
    final Map<String, dynamic> body = {
      "username": _emailController.text,
      "password": _passwordController.text,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        print('Login failed with status code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
      if (e is http.ClientException) {
        print('Possible CORS or network error.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Log in',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: const Color(0xFF57CC99),
                                  fontFamily:
                                      GoogleFonts.anekGurmukhi().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildLabelText(context, "Email"),
                        const SizedBox(height: 2),
                        _buildProjectedTextFormField(
                          controller: _emailController,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } /* else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }*/
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabelText(context, "Password"),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    color: const Color(0xFF838181),
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                Text(
                                  _isPasswordVisible ? 'Unhide' : 'Hide',
                                  style: TextStyle(
                                    color: const Color(0xFF838181),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        _buildPasswordField(),
                        const SizedBox(height: 2),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => work(),
                              ),
                            );
                          },
                          child: _buildLabelText(context, "Forgot Password ?"),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF57CC99),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Call the login function here
                                  _login();
                                }
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: GoogleFonts.signika().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight > 400
                      ? constraints.maxHeight - 400
                      : 0,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: BottomWaveClipper(),
                        child: Container(
                          width: double.infinity,
                          color: const Color(0xFFC7F9DE),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/oldcare2.png',
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 175,
                                child: const Divider(
                                  height: 1,
                                  color: Color(0x66666666),
                                ),
                              ),
                              const Text(
                                "Or",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0x66666666)),
                              ),
                              SizedBox(
                                width: 175,
                                child: const Divider(
                                  height: 1,
                                  color: Color(0x66666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()),
                              );
                            },
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF296685),
                                fontFamily: GoogleFonts.robotoFlex().fontFamily,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF296685),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabelText(BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        labelText,
        style: TextStyle(
          color: const Color(0xFF838181),
          fontSize: 16,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
      ),
    );
  }

  Widget _buildProjectedTextFormField({
    required TextEditingController controller,
    required bool isPassword,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          cursorColor: const Color(0xFF838181),
          obscureText: isPassword ? !_isPasswordVisible : false,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
          validator: validator,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return _buildProjectedTextFormField(
      controller: _passwordController,
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
