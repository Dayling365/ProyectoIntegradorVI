import 'package:flutter/material.dart';

class MovementSummary extends StatelessWidget {
  final int total;

  const MovementSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    const Color textSecondary = Color(0xFF8A94A6);
    const Color info = Color(0xFF2563EB);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.close,
              size: 16,
              color: info,
            ),
            SizedBox(width: 4),
            Text('Limpiar filtros',
              style: TextStyle(
                color: info,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text('$total movimientos registrados',
          style: const TextStyle(
            fontSize: 13,
            color: textSecondary,
          ),
        ),
      ],
    );
  }
}
