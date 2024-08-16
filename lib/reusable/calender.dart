import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekView extends StatelessWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final currentDate = DateFormat('yyyy-MM-dd').format(now);

    final dayInitials = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,),
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date = startOfWeek.add(Duration(days: index));
          final formattedDate = DateFormat('yyyy-MM-dd').format(date);
          final isToday = formattedDate == currentDate;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.only(left: 5,right: 5, top: 8),
            decoration: BoxDecoration(
              color: isToday ? const Color(0xFFE0FE10) : const Color(0xFF2A3036),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: isToday ? const Color(0xFF2A3036) : const Color(0xFFE0FE10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayInitials[date.weekday % 7],
                  style: TextStyle(
                    color: isToday ? const Color(0xFF2A3036) : const Color(0xFFE0FE10),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the container a circle
                    color: isToday ? Colors.black : Colors.transparent, // Background color
                    border: isToday
                        ? Border.all(
                      color: const Color(0xFFE0FE10), // Border color
                      width: 2,
                    )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(date),
                      style: TextStyle(
                        color: isToday ? const Color(0xFFE0FE10) : const Color(0xFFE0FE10), // Text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
