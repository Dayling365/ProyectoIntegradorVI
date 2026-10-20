import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesMeta extends StatelessWidget {
  final String date;
  final String clientName;
  final String seller;

  const SalesMeta({
    super.key,
    required this.date,
    required this.clientName,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row(Icons.calendar_today_outlined, 'Fecha y hora', date),
        const SizedBox(height: 10),
        _row(Icons.person_outline, 'Cliente', clientName),
        const SizedBox(height: 10),
        _row(Icons.badge_outlined, 'Vendedor', seller, valueColor: AppColors.textSecondary),
      ],
    );
  }

  Widget _row(IconData icon, String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppText.bodySecondary,
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}