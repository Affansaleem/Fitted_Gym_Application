import 'package:flutter/material.dart';
import '../reusable/notification_card.dart';


class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications",style: TextStyle(color: Color(0xFFE0FE10),fontSize: 30,fontWeight: FontWeight.bold),),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFF2A3036),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Image.asset("assets/images/img_14.png"),
                  Container(
                    padding: const EdgeInsets.all(8),
                      width: 300,
                      child: const Text("Subscribe To Unlock New Features and Get a Free Gym Kit",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  Positioned(
                      bottom: 0,
                      right: 1,
                      child: IconButton(onPressed: (){}, icon:const Icon( Icons.diamond,color: Color(0xFFD5F112),)))
                ],
              ),
            ),
            const Column(
              children: [
                NotificationCard(
                  title: "Healthy Diet Greater in People Generic Risk for Obesity",
                  date: "4-Sep-2024",
                  buttonText: "Follow",
                  imagePath: "assets/images/img_15.png",
                ),
                NotificationCard(
                  title: "Learn How to Balance Your Poster During Pushups",
                  date: "5-July-2024",
                  buttonText: "Follow",
                  imagePath: "assets/images/img_16.png",
                ),
                NotificationCard(
                  title: "I Strayed Hydrated for Two Weeks, Learn How?",
                  date: "6-Jun-2024",
                  buttonText: "Follow",
                  imagePath: "assets/images/img_17.png",
                ),
              ],

            ),

          ],
        ),
      ),
    );
  }
}
