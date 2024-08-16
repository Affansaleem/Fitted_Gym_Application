import 'package:fitted/home/HomePage1.dart';
import 'package:fitted/home/HomePage2.dart';
import 'package:fitted/home/HomePage3.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../Workouts/MyWorkoutsPage.dart';
import '../home/HomePage.dart';


class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HomePage2(),
    const HomePage1(),
    const HomePage3(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Circular shape
        ),
        child: const Icon(
          Icons.add_circle,
          size: 50,
          color: Color(0xFFE0FE10),
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const MyWorkoutsPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 0.9);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 30,
        splashSpeedInMilliseconds: 300,
        backgroundColor: const Color(0xFF2A3036),
        activeColor: const Color(0xFFE0FE10),
        inactiveColor: Colors.white,
        icons: const [
          Icons.home_filled,
          Icons.fastfood_outlined,
          Icons.auto_graph,
          Icons.notifications,
        ],
        gapLocation: GapLocation.center,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        activeIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
