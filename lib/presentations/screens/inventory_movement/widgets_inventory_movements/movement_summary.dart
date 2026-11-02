import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementSummary extends StatelessWidget {
  final int total;
  final VoidCallback onClearFilters;

  const MovementSummary({super.key, required this.total, required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onClearFilters,
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.close, size: 16, color: AppColors.primary),
              SizedBox(width: 4),
              Text('Limpiar filtros', style: AppText.bodyStrongPrimary),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$total movimientos registrados',
          style: AppText.bodySecondary,
        ),
      ],
    );
  }
}
