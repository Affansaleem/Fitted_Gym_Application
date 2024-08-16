import 'package:flutter/material.dart';

class HorizontalGridCards extends StatelessWidget {
  final List<CardItem> items;

  const HorizontalGridCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 13.0,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final item = items[index];
                return _buildCard(item.title, item.imagePath, item.icon, item.time);
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String imagePath, IconData icon, String time) {
    return Card(
      elevation: 5,
      color: const Color(0xFF2A3036),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 40,
            width: 38,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Icon(icon, size: 20,color: const Color(0xFFE0FE10),),
                const SizedBox(width: 8),
                Text(time, style: const TextStyle(fontSize: 14,color: Colors.white)),
              ],
            ),
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

  CardItem({
    required this.title,
    required this.imagePath,
    required this.icon,
    required this.time,
  });
}
