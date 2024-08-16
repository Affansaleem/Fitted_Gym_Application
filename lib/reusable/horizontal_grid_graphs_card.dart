import 'package:flutter/material.dart';

class HorizontalGridGraphCards extends StatelessWidget {
  final List<CardItem> items;

  const HorizontalGridGraphCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 13.0,
              childAspectRatio: 1.13,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final item = items[index];
                return _buildCard(item.title, item.graphData);
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, List<int> graphData) {
    return Card(
      elevation: 5,
      color: const Color(0xFF2A3036),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Heading
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          // Circular filled graph
          SizedBox(
            height: 100,
            width: 100,
            child: CustomPaint(
              painter: CircleGraphPainter(graphData),
              child: Center(
                child: Text(
                  '${graphData.isNotEmpty ? (graphData.reduce((a, b) => a + b)).toStringAsFixed(0) : '0'} cal',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleGraphPainter extends CustomPainter {
  final List<int> graphData;

  CircleGraphPainter(this.graphData);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final Paint borderPaint = Paint()
      ..color = const Color(0xFF2A3036) // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final Paint fillPaint = Paint()
      ..style = PaintingStyle.fill;

    // Draw border
    canvas.drawCircle(Offset(centerX, centerY), radius, borderPaint);

    final double startAngle = -90 * (3.14 / 180); // Starting angle in radians
    double currentAngle = startAngle;

    // Calculate total value
    int total = graphData.reduce((a, b) => a + b);

    // Draw arcs
    for (int value in graphData) {
      // Calculate percentage and sweep angle
      final double percentage = total > 0 ? value / total : 0;
      final double sweepAngle = percentage * (2 * 3.14); // Convert to radians

      fillPaint.color = Color.lerp(
        const Color(0xFFE0FE10),
        const Color(0xFF00FF00), // Example gradient colors
        percentage,
      )!;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - borderPaint.strokeWidth / 2),
        currentAngle,
        sweepAngle,
        true,
        fillPaint,
      );

      currentAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CardItem {
  final String title;
  final List<int> graphData;

  CardItem({
    required this.title,
    required this.graphData,
  });
}
