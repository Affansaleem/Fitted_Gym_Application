import 'package:flutter/material.dart';

class VerticalGridCards extends StatelessWidget {
  final List<CardItem> items;

  const VerticalGridCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 7.0,
              childAspectRatio: 3.1,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final item = items[index];
                return _buildCard(item.title, item.imagePath, item.icon, item.time, item.steps, item.subtitle);
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String imagePath, IconData icon, String time, String steps, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF2A3036),
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color
            offset: const Offset(0, 4), // Position of the shadow
            blurRadius: 10, // Blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath,
                height: 40,
                width: 38,
              ),
              Row(
                children: [
                  Text(
                    steps,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFE0FE10),
                ),
                child: Text(time, style: const TextStyle(fontSize: 14, color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardItem {
  final String title;
  final String imagePath;
  final IconData icon;
  final String time;
  final String steps;
  final String subtitle;

  CardItem({
    required this.title,
    required this.imagePath,
    required this.icon,
    required this.time,
    required this.steps,
    required this.subtitle,
  });
}
