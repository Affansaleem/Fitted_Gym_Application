import 'package:fitted/welcome/welcomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("Hello");
    Future.delayed(const Duration(seconds: 3),()=> Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=> const WelcomePage()),(route)=>false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: Center(
        child: Image.asset("assets/images/img.png"),
      ),
    );
  }
}
