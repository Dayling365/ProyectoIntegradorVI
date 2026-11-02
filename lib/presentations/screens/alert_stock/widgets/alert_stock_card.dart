import 'package:flutter/material.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../../data/models/alert_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class AlertStockCard extends StatelessWidget {
  final AlertModel item;
  final AlertSeverity severity;

  const AlertStockCard({super.key, required this.item, required this.severity});

  Color get _chipBg {
    switch (severity) {
      case AlertSeverity.critical:
        return AppColors.errorBackground;
      case AlertSeverity.warning:
        return AppColors.warningBackground;
    }
  }

  Color get _chipColor {
    switch (severity) {
      case AlertSeverity.critical:
        return AppColors.error;
      case AlertSeverity.warning:
        return AppColors.warningDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = [
      item.categoryName,
      'Min: ${item.minStock} unid.',
    ].whereType<String>().join(' • ');

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.productDetails,
        arguments: item.productId,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.productName, style: AppText.subtitle),
                  const SizedBox(height: 2),
                  Text(subtitle, style: AppText.caption),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: _chipBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${item.unitsInStock} unid.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _chipColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
