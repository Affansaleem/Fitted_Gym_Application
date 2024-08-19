import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitted/firebase_authentication/firebase_auth_services.dart';
import 'package:fitted/signin/SignInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool _obscureText = true;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _showPassword = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _togglePasswordVisibility(bool? value) {
    setState(() {
      _obscureText = !(_showPassword = value ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(children: [
            const SizedBox(width: 30),
            Image.asset(
              'assets/images/img.png',
              width: 80,
              height: 80,
            ),
          ]),
          Stack(
            children: [
              Image.asset(
                'assets/images/img_3.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height - 130,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shape Your",
                      style: TextStyle(
                        color: const Color(0xFFE0FF00),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: const Color(0xFFE0FF00).withOpacity(0.8),
                            offset: const Offset(1, 1),
                            blurRadius: 50,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Muscles",
                      style: TextStyle(
                        color: const Color(0xFFE0FF00),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: const Color(0xFFE0FF00).withOpacity(0.8),
                            offset: const Offset(1, 1),
                            blurRadius: 50,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 410,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              "Sign Up to create account",
                              style: TextStyle(
                                color: Color(0xFFE0FF00),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // Full Name
                            TextField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.person_2_outlined,
                                    color: Colors.black), // Icon for email
                              ),
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                            ),

                            const SizedBox(height: 20),
                            // Email Field
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Enter Your Email',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.email_outlined,
                                    color: Colors.black), // Icon for email
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black),
                            ),

                            const SizedBox(height: 20),
                            TextField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Enter Your Password',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.lock_outline,
                                    color: Colors.black), // Icon for password
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.lock_outline,
                                    color: Colors.black), // Icon for password
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Show Password",
                                  style: TextStyle(color: Color(0xFFE0FF00)),
                                ),
                                Checkbox(
                                  value: !_obscureText,
                                  onChanged: _togglePasswordVisibility,
                                  checkColor: Colors.white,
                                  activeColor: Colors.transparent,
                                ),
                              ],
                            ),
                            // Sign In Button
                            ElevatedButton(
                              onPressed: signup,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFE0FF00),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const SignInPage())),
                                  child: const Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        color: Color(0xFFE0FF00),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFFE0FF00)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void signup() async {
    String username = _userNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Check if all fields are filled
    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      User? user = await _auth.signUpWithEmailandPassword(email, password);

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Registered Successfully"))
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred while creating user')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

}
