import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current year
    final currentYear = DateTime.now().year;

    return Column(
      children: [
        const SizedBox(
        height: 10
        ),
        Text(
        'COPYRIGHT INTELLIGENTSO $currentYear',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.grey
        ),
      ),
      ],
    );
  }
}