import 'package:flutter/material.dart';
import 'alert_stock_item.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class AlertStockCard extends StatelessWidget {
  final AlertStockItem item;

  const AlertStockCard({super.key, required this.item});

  Color get _iconBg {
    switch (item.category) {
      case 'Papelería':
        return AppColors.infoBackground;
      case 'Escritura':
        return AppColors.warningBackground;
      case 'Útiles':
        return AppColors.chartPinkBackground;
      default:
        return AppColors.chartPurpleBackground;
    }
  }

  Color get _iconColor {
    switch (item.category) {
      case 'Papelería':
        return AppColors.primary;
      case 'Escritura':
        return AppColors.warningDark;
      case 'Útiles':
        return AppColors.chartPink;
      default:
        return AppColors.chartPurple;
    }
  }

  Color get _chipBg {
    switch (item.severity) {
      case AlertSeverity.critical:
        return AppColors.errorBackground;
      case AlertSeverity.warning:
        return AppColors.warningBackground;
      case AlertSeverity.info:
        return AppColors.infoBackground;
    }
  }

  Color get _chipColor {
    switch (item.severity) {
      case AlertSeverity.critical:
        return AppColors.error;
      case AlertSeverity.warning:
        return AppColors.warningDark;
      case AlertSeverity.info:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: _iconBg, shape: BoxShape.circle),
            child: Icon(item.icon, color: _iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: AppText.subtitle),
                const SizedBox(height: 2),
                Text('${item.category} • Min: ${item.minStock} unid.',
                    style: AppText.caption),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: _chipBg, borderRadius: BorderRadius.circular(20)),
            child: Text('${item.quantity} unid.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _chipColor)),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
        ],
      ),
    );
  }
}