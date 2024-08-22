import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitted/forget_password/ForgetPassword1Page.dart';
import 'package:fitted/global/Signin_global.dart';
import 'package:fitted/navigationBar/NavigationBar.dart';
import 'package:fitted/reusable/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_authentication/firebase_auth_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSigning = false;
  bool _obscureText = true;
  late bool _showPassword = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Map<String, dynamic>? employeeData;

  Future<void> fetchEmployeeData() async {
    Map<String, dynamic>? data = await DatabaseMethods().getEmployee("0");
    setState(() {
      employeeData = data;
      GlobalVars.profileImage = employeeData?['profileImageUrl'];
      print(GlobalVars.profileImage);
    });
  }

  @override
  void dispose() {
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
                      "Be,",
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
                      "Yourself",
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
                              "Sign in to your account",
                              style: TextStyle(
                                color: Color(0xFFE0FF00),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
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
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const ForgetPassword1PagePage()));
                                },
                                child: const Text(
                                  "Forget password?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),

                            // Sign In Button
                            ElevatedButton(
                              onPressed: signin,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFE0FF00),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: _isSigning
                                  ? const CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                  : const Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 20,
                                    endIndent: 10,
                                    height: 10,
                                  ),
                                ),
                                Text(
                                  "Sign in with",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 20,
                                    height: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Handle Facebook icon tap
                                      print("Facebook icon tapped");
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: Color(0xFFE0FF00),
                                      // Facebook color
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Instagram Sign-In Button
                                  InkWell(
                                    onTap: () {
                                      // Handle Instagram icon tap
                                      print("Instagram icon tapped");
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Color(0xFFE0FF00),
                                      // Instagram color
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Google Sign-In Button
                                  InkWell(
                                    onTap: () {
                                      _SignInGoogle();
                                      // Handle Google icon tap
                                      print("Google icon tapped");
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.google,
                                      color: Color(0xFFE0FF00), // Google color
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
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

  void signin() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      setState(() {
        _isSigning = false;
      });
      return;
    }

    try {
      User? user = await _auth.signInWithEmailandPassword(email, password);

      if (user != null) {
        showToast(message: "User LoggedIn Successfully");
        GlobalVars.uid = user.uid;
        await fetchEmployeeData();

        setState(() {
          _isSigning = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainContainer()),
        );
      } else {
        showToast(message: "Error Occurred");
        setState(() {
          _isSigning = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      setState(() {
        _isSigning = false;
      });
    }
  }

  _SignInGoogle() async {
    final GoogleSignIn _googleSignin = GoogleSignIn();

    try {
      final GoogleSignInAccount? account = await _googleSignin.signIn();
      if (account != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await account.authentication;
        final AuthCredential credentials = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(credentials);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainContainer()));
      }
    } catch (e) {
      print('Google Sign-In error: $e');
      showToast(message: "Error Occurred: $e");
    }
  }
}
