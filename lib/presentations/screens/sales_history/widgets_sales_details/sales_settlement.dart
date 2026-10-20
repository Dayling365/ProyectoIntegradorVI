import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesSettlement extends StatelessWidget {
  final double subtotal;
  final double total;
  final double cashGiven;
  final double changeGiven;

  const SalesSettlement({
    super.key,
    required this.subtotal,
    required this.total,
    required this.cashGiven,
    required this.changeGiven,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESUMEN DE LIQUIDACIÓN',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        _row('Subtotal', 'C\$${subtotal.toStringAsFixed(2)}'),
        const SizedBox(height: 8),
        _row(
          'Total Neto',
          'C\$${total.toStringAsFixed(2)}',
          bold: true,
          valueColor: AppColors.primary,
          fontSize: 16,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _row('Efectivo entregado:', 'C\$${cashGiven.toStringAsFixed(2)}', bold: true),
              const SizedBox(height: 6),
              _row(
                'Cambio devuelto:',
                'C\$${changeGiven.toStringAsFixed(2)}',
                bold: true,
                valueColor: AppColors.success,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String label, String value, {bool bold = false, Color? valueColor, double fontSize = 13}) {
    return Row(
      children: [
        Text(
          label,
          style: AppText.bodySecondary,
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}