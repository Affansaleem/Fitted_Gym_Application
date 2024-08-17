import 'package:firebase_core/firebase_core.dart';
import 'package:fitted/splash/SplashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC-bx6MtG5EUvoo4Kah2UKpWyvvAeiEMpg",
            appId: "1:314752047419:web:e2aa2cf3826208ae447f1e",
            messagingSenderId: "314752047419",
            projectId: "fitted-5dd2e"));
  } else {
    print("Hello");
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: const SignInPage(),
      // home: const SignUpPage(),
      // home: const ForgetPassword1PagePage(),
      // home: const ForgetPassword2PagePage(),
      // home: const ForgetPassword3PagePage(),
      // home:  const MainContainer(),
      // home: const HomePage1(),
      // home: OptionSelector(),
    );
  }
}
