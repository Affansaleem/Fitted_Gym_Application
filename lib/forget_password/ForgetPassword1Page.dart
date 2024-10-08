import 'package:fitted/reusable/toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'ForgetPassword2Page.dart'; // Make sure this file exists

class ForgetPassword1PagePage extends StatefulWidget {
  const ForgetPassword1PagePage({super.key});

  @override
  State<ForgetPassword1PagePage> createState() => _ForgetPassword1PagePageState();
}

class _ForgetPassword1PagePageState extends State<ForgetPassword1PagePage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());

        showToast(message:'Password reset email sent! Check your inbox.');

      Navigator.pop(context);
    } catch (e) {
      showToast(message:"Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                left: 10,
                child: Image.asset("assets/images/img_5.png", height: 400),
              ),
              Image.asset(
                'assets/images/img_3.png',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 400,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 380,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Please Enter Your Email Address To Receive a Verification Code",
                          style: TextStyle(
                            color: Color(0xFFE0FF00),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Email Input
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter Email Address',
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Try Another Way",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 20),

                      // Send Button
                      ElevatedButton(
                        onPressed: _sendPasswordResetEmail,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xFFE0FF00),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "SEND",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
