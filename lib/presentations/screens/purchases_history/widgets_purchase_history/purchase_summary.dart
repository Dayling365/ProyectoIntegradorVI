import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseSummary extends StatelessWidget {
  final int total;

  const PurchaseSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.close,
              size: 16,
              color: AppColors.primary,
            ),
            SizedBox(width: 4),
            Text(
              'Limpiar filtros',
              style: AppText.bodyStrongPrimary,
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          '$total compras registradas',
          style: AppText.bodySecondary,
        ),
      ],
    );
  }
}


