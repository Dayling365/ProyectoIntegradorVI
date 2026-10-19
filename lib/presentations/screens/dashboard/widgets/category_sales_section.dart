import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class CategorySalesSection extends StatelessWidget {
  const CategorySalesSection({super.key});


   static const List<(String, double, Color)> _data = [
    ('Libros', 0.42, AppColors.primary),
    ('Útiles escolares', 0.26, AppColors.accent),
    ('Papelería', 0.18, AppColors.info),
    ('Otros', 0.14, AppColors.textSecondary),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.accentLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bar_chart,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                'Ventas por categoría',
                style: AppText.title,
              ),
            ],
          ),

          const SizedBox(height: 16),

          ..._data.map((row) {
            final (label, value, color) = row;

            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      label,
                      style: AppText.body,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor: AppColors.borderLight,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(color),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 46,
                    child: Text(
                      '${(value * 100).toStringAsFixed(0)}%',
                      textAlign: TextAlign.right,
                      style: AppText.caption,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}