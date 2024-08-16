import 'package:fitted/signin/SignInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPassword3PagePage extends StatefulWidget {
  const ForgetPassword3PagePage({super.key});

  @override
  State<ForgetPassword3PagePage> createState() => _ForgetPassword3PagePageState();
}

class _ForgetPassword3PagePageState extends State<ForgetPassword3PagePage> {
  bool _obscureText = true;

  bool _showPassword = false;

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
          Stack(
            children: [
              Positioned(
                left: 20,
                child: Image.asset("assets/images/img_8.png",
                  width: 400,
                ),
              ),
              Positioned(
                left: 110,
                top: 100,
                child: Image.asset("assets/images/img_6.png",
                  width: 200,
                ),
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
                        child:  Text(
                          textAlign: TextAlign.center,
                          "Your New Password Must Be Different From Your Old Password",
                          style: TextStyle(
                            color: Color(0xFFE0FF00),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      // Full Name
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.black), // Icon for password
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),

                      const SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.black), // Icon for password
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Show Password",
                            style: TextStyle(color: Color(0xFFE0FF00)),
                          ),
                          Checkbox(
                            value: !_obscureText,
                            onChanged: _togglePasswordVisibility ,
                            checkColor: Colors.white,
                            activeColor: Colors.transparent,
                          ),
                        ],
                      ),
                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>const SignInPage()));
                          // Add sign-in logic here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:const  Color(0xFFE0FF00),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "SAVE",
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
