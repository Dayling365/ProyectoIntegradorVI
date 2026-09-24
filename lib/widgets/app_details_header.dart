import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36))),
        const SizedBox(height: 4),
        Text(subtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
      ],
    );
  }
}