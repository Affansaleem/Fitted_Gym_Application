import 'package:fitted/signup/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signin/SignInPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFF333333),
        backgroundColor: const Color(0xFF2C2C2C),

        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/img_3.png',
              ),
              Image.asset(
                'assets/images/img_4.png',
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const SignInPage()));

            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFE0FF00),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              "SIGN IN",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 5,),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const SignUpPage()));
                    },
                  child: const Text("SIGN UP",style:
                  TextStyle(
                    color: Color(0xFFE0FF00),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE0FF00),
                    decorationThickness: 2.0,
                  ),))
            ],
          ),


        ],
      )

    );
  }
}
