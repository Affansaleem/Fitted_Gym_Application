import 'package:flutter/material.dart';
import '../global/Signin_global.dart';
import '../reusable/calender.dart';
import '../reusable/vertical_grid_cards.dart';
import 'package:intl/intl.dart';


class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {


  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayOfWeek = DateFormat('EEEE').format(now); // Full day of the week
    final dayOfMonth = DateFormat('d').format(now); // Day of the month
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "$dayOfWeek,$dayOfMonth",
          style: const TextStyle(
            color: Color(0xFFE0FE10),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: GlobalVars.profileImage != null
                ? Image.network(
              GlobalVars.profileImage!,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ):Image.asset("assets/images/img_19.png",
              height: 60,width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
        ],
        backgroundColor: const Color(0xFF1C2126),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const WeekView(),
            const SizedBox(height: 20,),
            VerticalGridCards(
              items: [
                CardItem(
                  title: 'Dumbbell Rows',
                  imagePath: 'assets/images/img_12.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                  steps: '3985',
                  subtitle: ' Steps',
                ),
                CardItem(
                  title: 'Cycling',
                  imagePath: 'assets/images/img_11.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                  steps: '17',
                  subtitle: ' Km',
                ),
                CardItem(
                  title: 'Workout',
                  imagePath: 'assets/images/img_10.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                  steps: '45',
                  subtitle: ' Minutes',
                ),
                CardItem(
                  title: 'Walking',
                  imagePath: 'assets/images/img_13.png',
                  icon: Icons.access_time,
                  time: '1Hr 20Min',
                  steps: '35',
                  subtitle: ' Minutes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
