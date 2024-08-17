import 'package:fitted/forget_password/ForgetPassword3Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPassword2PagePage extends StatefulWidget {
  const ForgetPassword2PagePage({super.key});

  @override
  State<ForgetPassword2PagePage> createState() => _ForgetPassword2PagePageState();
}

class _ForgetPassword2PagePageState extends State<ForgetPassword2PagePage> {


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
                child: Image.asset("assets/images/img_7.png",
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
                          "Enter Verification Code Just Sent To Your Email Address",
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
                        decoration: InputDecoration(
                          labelText: 'Enter Verification Code',
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.verified_user_outlined, color: Colors.black), // Icon for email
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 20,),
                      const Text("Resend Code", style: TextStyle(color: Colors.white,fontSize: 18),),
                      const SizedBox(height: 20,),

                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>const ForgetPassword3PagePage()));
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
                          "VERIFY",
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
