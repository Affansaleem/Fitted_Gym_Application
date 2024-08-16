import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  final String buttonText;
  final String imagePath;

  const NotificationCard({
    super.key,
    required this.title,
    required this.date,
    required this.buttonText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11,horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 11),
      decoration: BoxDecoration(
        color: const Color(0xFF2A3036),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.alarm, color: Color(0xFFE0FE10)),
                    const SizedBox(width: 4),
                    Text(date, style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                    const SizedBox(width: 10),
                    const Icon(Icons.add, color: Color(0xFFE0FE10)),
                    const SizedBox(width: 4),
                    Text(buttonText, style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
           SizedBox(
            width: 104,
            height: 90,
            child: Image.asset(imagePath),
          ),
        ],
      ),
    );
  }
}
