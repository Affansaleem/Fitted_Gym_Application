import 'package:fitted/reusable/OptionsPage.dart';
import 'package:flutter/material.dart';

class MyWorkoutsPage extends StatefulWidget {
  const MyWorkoutsPage({super.key});

  @override
  State<MyWorkoutsPage> createState() => _MyWorkoutsPageState();
}

class _MyWorkoutsPageState extends State<MyWorkoutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFE0FE10)),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
        title: const Text(
          "My Workouts",
          style: TextStyle(
              color: Color(0xFFE0FE10),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Image.asset(
              "assets/users/self.jpeg",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,)
        ],
        backgroundColor: const Color(0xFF1C2126),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              OptionSelector(),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A3036),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/images/img_18.png"),
              ),
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  child: Text(
                    "Press the + Button to Add More Workouts or Exercise In Your Routine",
                    style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30), // Adjust padding as needed
              child: Container(
                height: 60,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0FE10),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE0FE10).withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "ADD EXERCISE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
