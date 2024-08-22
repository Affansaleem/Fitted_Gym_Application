import 'package:fitted/reusable/horizontal_grid_graphs_card.dart';
import 'package:flutter/material.dart';
import '../global/Signin_global.dart';
import '../reusable/calender.dart';
import 'package:intl/intl.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


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

            const WeekView(), // Replace with the custom WeekView widget
            const SizedBox(height: 20,),
            HorizontalGridGraphCards(
              items: [
                CardItem(
                  title: 'Breakfast',
                  graphData: [93, 20],

                ),
                CardItem(
                  title: 'Lunch',
                  graphData: [10, 50],

                ),
                CardItem(
                  title: 'Dinner',
                  graphData: [60, 20],

                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2A3036),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text("Breakfast:",style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                        color: Colors.white
                      ),
                      ),
                      Text("  113",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD5F112)
                      ),
                      ),
                      Text(" cal",
                        textAlign: TextAlign.center
                        ,style: TextStyle(

                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),

                  IconButton(onPressed: (){}, icon:const Icon( Icons.arrow_forward_ios,color: Color(0xFFD5F112),))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2A3036),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text("Lunch:",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: Colors.white
                          ),
                          ),
                          Text("  113",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD5F112)
                          ),
                          ),
                          Text(" cal",
                            textAlign: TextAlign.center
                            ,style: TextStyle(

                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/img.png', // Replace with the path to your image asset
                          color: const Color(0xFFD5F112),
                          height: 40,// Optional: Apply color if needed
                        ),
                      )
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.rice_bowl,color: Color(0xFFD5F112),size: 40,),
                    title: Text("Bread and Eggs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    subtitle: Text("25 Teaspoons",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 15),),
                    trailing: Text("136",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD5F112)
                    ),),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.rice_bowl,color: Color(0xFFD5F112),size: 35,),
                    title: Text("Fish Curry",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    subtitle: Text("1.5 cups",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 15),),
                    trailing: Text("182",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD5F112)
                      ),),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.egg_rounded,color: Color(0xFFD5F112),size: 40,),
                    title: Text("Egg Omelette",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    subtitle: Text("1 Servings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 15),),
                    trailing: Text("80",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD5F112)
                      ),),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF2A3036),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text("Dinner:",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                      ),
                      ),
                      Text("  200",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD5F112)
                      ),
                      ),
                      Text(" cal",
                        textAlign: TextAlign.center
                        ,style: TextStyle(

                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),

                  IconButton(onPressed: (){}, icon:const Icon( Icons.arrow_forward_ios,color: Color(0xFFD5F112),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
