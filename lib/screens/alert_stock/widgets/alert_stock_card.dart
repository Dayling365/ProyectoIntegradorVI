import 'package:flutter/material.dart';
import 'alert_stock_item.dart';

class AlertStockCard extends StatelessWidget {
  final AlertStockItem item;

  const AlertStockCard({super.key, required this.item});

  Color get _iconBg {
    switch (item.category) {
      case 'Papelería':
        return const Color(0xFFDCEBFB);
      case 'Escritura':
        return const Color(0xFFFEF3D7);
      case 'Útiles':
        return const Color(0xFFFCE7F3);
      default:
        return const Color(0xFFEDE9FE);
    }
  }

  Color get _iconColor {
    switch (item.category) {
      case 'Papelería':
        return const Color(0xFF1B4B91);
      case 'Escritura':
        return const Color(0xFFD97706);
      case 'Útiles':
        return const Color(0xFFDB2777);
      default:
        return const Color(0xFF7C3AED);
    }
  }

  Color get _chipBg {
    switch (item.severity) {
      case AlertSeverity.critical:
        return const Color(0xFFFEE2E2);
      case AlertSeverity.warning:
        return const Color(0xFFFEF3D7);
      case AlertSeverity.info:
        return const Color(0xFFDBEAFE);
    }
  }

  Color get _chipColor {
    switch (item.severity) {
      case AlertSeverity.critical:
        return const Color(0xFFDC2626);
      case AlertSeverity.warning:
        return const Color(0xFFD97706);
      case AlertSeverity.info:
        return const Color(0xFF2563EB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
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
                Text(item.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36))),
                const SizedBox(height: 2),
                Text('${item.category} • Min: ${item.minStock} unid.',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
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
          const Icon(Icons.chevron_right, size: 18, color: Color(0xFFC5CAD6)),
        ],
      ),
    );
  }
}