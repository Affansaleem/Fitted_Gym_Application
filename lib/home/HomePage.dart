
import 'package:flutter/material.dart';
import '../reusable/horizontal_grid_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2126),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset("assets/users/self.jpeg",height: 60,width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Column(
                    children: [
                      Text("Hi, Affan Saleem",style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                      Text(" GET IN SHAPE",
                        style: TextStyle(
                          color: Color(0xFFE0FE10),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Card(
                  margin: const EdgeInsets.all(15),
                  color:const Color(0xFF2A3036),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top:40,bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1C2126),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                          ),
                          child: const Text("Entry Level",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        const Text("Bench Press",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                        const SizedBox(
                            width: 220,
                            child: Text("10 Bench Press Workout Videos For You",style: TextStyle(color: Color(0xFFE0FE10),fontSize: 18),)),
                        const SizedBox(height: 20,),
                        const Row(
                          children: [
                            Icon(Icons.play_circle_outlined,size: 80,color: Colors.white,),
                            Text("34 Minutes",style:
                            TextStyle(
                              color: Color(0xFFE0FE10),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 300,
                    bottom: 30,
                    child: Image.asset("assets/images/img_9.png",height: 250,)),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Popular Exercises",style:
                TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE0FE10)
                ),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A3036),
                    borderRadius: BorderRadius.all(Radius.circular(20)),

                  ),
                  child: const Text("View All",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            HorizontalGridCards(
              items: [
                CardItem(
                  title: 'Dumbbell Rows',
                  imagePath: 'assets/images/img_10.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                ),
                CardItem(
                  title: 'Cycling',
                  imagePath: 'assets/images/img_11.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                ),
                CardItem(
                  title: 'Walking',
                  imagePath: 'assets/images/img_12.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
