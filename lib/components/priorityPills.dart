import 'package:flutter/material.dart';

class PriorityPills extends StatelessWidget {
  final String text;
  final String priority;

  const PriorityPills({super.key, required this.text, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (priority.toLowerCase()) {
      case 'high':
        color = Colors.red;
        break;
      case 'ongoing':
        color = Colors.orange;
        break;
      case 'normal':
        color = Colors.green;
        break;
      default:
        color = Colors.blue;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Icon(
              Icons.circle,
              color: color,
              size: 12,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}