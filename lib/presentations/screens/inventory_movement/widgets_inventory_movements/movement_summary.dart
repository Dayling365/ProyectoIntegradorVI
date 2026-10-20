import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementSummary extends StatelessWidget {
  final int total;

  const MovementSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.close,
              size: 16,
              color: AppColors.primary,
            ),
            SizedBox(width: 4),
            Text('Limpiar filtros',
              style: AppText.bodyStrongPrimary,
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text('130 movimientos registrados',
          style: AppText.bodySecondary,
        ),
      ],
    );
  }
}
