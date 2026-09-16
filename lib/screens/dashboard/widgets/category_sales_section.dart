import 'package:flutter/material.dart';

class CategorySalesSection extends StatelessWidget {
  const CategorySalesSection({super.key});

  static const Color primary = Color(0xFF1B2A5C);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);
  static const Color textSecondary = Color(0xFF8A94A6);
  static const Color card = Colors.white;
  static const Color border = Color(0xFFE5E7EB);
  static const Color greyLight = Color(0xFFE5E7EB);
  static const Color iconBg = Color(0xFFDCEBFB); 

  static const List<(String, double, Color)> _data = [
    ('Libros', 0.42, primary),
    ('Útiles escolares', 0.26, warning),
    ('Papelería', 0.18, info),
    ('Otros', 0.14, textSecondary),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: border,
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
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bar_chart,
                  size: 20,
                  color: primary,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                'Ventas por categoría',
                style: TextStyle(
                  color: Color(0xFF1A1F36),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
                      style: const TextStyle(
                        color: Color(0xFF1A1F36),
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor: greyLight,
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
                      style: const TextStyle(
                        color: textSecondary,
                        fontSize: 12,
                      ),
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