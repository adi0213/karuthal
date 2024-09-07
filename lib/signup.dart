import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_chilla/design.dart';
import 'package:new_chilla/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Create Account',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: Color(0xFF57CC99),
                                  fontFamily:
                                      GoogleFonts.anekGurmukhi().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildLabelText(context, "User Name"),
                        const SizedBox(height: 2),
                        _buildProjectedTextFormField(
                          controller: _usernameController,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildLabelText(context, "Email"),
                        const SizedBox(height: 2),
                        _buildProjectedTextFormField(
                          controller: _emailController,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabelText(context, "Password"),
                            Row(children: [
                              IconButton(
                                icon: Icon(
                                  color: Color(0xFF838181),
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
                            ]),
                          ],
                        ),
                        const SizedBox(height: 2),
                        _buildPasswordField(),
                        const SizedBox(height: 40),
                        Center(
                          child: SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF57CC99),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Perform signup action
                                }
                              },
                              child: Text(
                                "Sign Up",
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
                  height: constraints.maxHeight - 400,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: BottomWaveClipper(),
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFFC7F9DE),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/image.png',
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 48.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Sign in with ",
                                        style: TextStyle(
                                          color: const Color(0xFF57CC99),
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.signika().fontFamily,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Image.asset(
                                        'assets/google_logo.png',
                                        height: 30.0,
                                        width: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: const Color(0xFF38A3A5),
                                    fontSize: 18,
                                    fontFamily:
                                        GoogleFonts.robotoFlex().fontFamily,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                        color: const Color(0xFF296685),
                                        fontWeight: FontWeight.normal,
                                        fontFamily:
                                            GoogleFonts.robotoFlex().fontFamily,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage1()),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
          color: Color(0xFF838181),
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
          cursorColor: Color(0xFF838181),
          obscureText: isPassword ? !_isPasswordVisible : false,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
          validator: validator,
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
        } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
          return 'Password must contain at least one lowercase letter';
        } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
          return 'Password must contain at least one uppercase letter';
        } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
          return 'Password must contain at least one digit';
        } else if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
          return 'Password must contain at least one special character';
        }
        return null;
      },
    );
  }
}
