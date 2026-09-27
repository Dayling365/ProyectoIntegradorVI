import 'package:flutter/material.dart';
import '../../models_product/product.dart';
import '../../../app_routes.dart';

class LowStockItem {
  final String name;
  final String category;
  final int quantity;
  final IconData icon;

  const LowStockItem(this.name, this.category, this.quantity, this.icon);
}

class LowStockSection extends StatelessWidget {
  const LowStockSection({super.key});

  static const List<LowStockItem> _items = [
    LowStockItem('Cuaderno Espiral A4', 'Papelería', 3, Icons.menu_book),
    LowStockItem('Lápiz Grafito HB', 'Escritura', 6, Icons.edit),
    LowStockItem('Goma de borrar Blanca', 'Útiles', 8, Icons.crop_square),
    LowStockItem('Marcador Permanente', 'Escritura', 12, Icons.brush),
  ];

  static const int criticalThreshold = 8;

  static const Color card = Colors.white;
  static const Color border = Color(0xFFE5E7EB);
  static const Color danger = Color(0xFFDC2626);
  static const Color dangerSoft = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFD97706);
  static const Color warningSoft = Color(0xFFFEF3D7);
  static const Color textPrimary = Color(0xFF1A1F36);
  static const Color textSecondary = Color(0xFF8A94A6);
  static const Color chevron = Color(0xFFC5CAD6);

  Color _iconBgFor(String category) {
    switch (category.toLowerCase()) {
      case 'papelería':
        return const Color(0xFFDCEBFB);
      case 'útiles':
        return dangerSoft;
      default:
        return warningSoft;
    }
  }

  Color _iconColorFor(String category) {
    switch (category.toLowerCase()) {
      case 'papelería':
        return const Color(0xFF1B4B91);
      case 'útiles':
        return danger;
      default:
        return warning;
    }
  }

  Product? _findProduct(String name) {
    for (final p in demoProducts) {
      if (p.name == name) return p;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              color: dangerSoft,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: danger.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: danger,
                    size: 16,
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    'Alertas de bajo stock',
                    style: TextStyle(
                      color: danger,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const Icon(Icons.chevron_right, color: danger, size: 20),
              ],
            ),
          ),

          ..._items.map((item) {
            final isCritical = item.quantity <= criticalThreshold;
            final badgeBg = isCritical ? dangerSoft : warningSoft;
            final badgeColor = isCritical ? danger : warning;
            final isLast = item == _items.last;

            return Container(
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : const Border(
                        bottom: BorderSide(color: Color(0xFFF0F1F4)),
                      ),
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _iconBgFor(item.category),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: _iconColorFor(item.category),
                    size: 18,
                  ),
                ),

                title: Text(
                  item.name,
                  style: const TextStyle(
                    color: textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                subtitle: Text(
                  item.category,
                  style: const TextStyle(color: textSecondary, fontSize: 12.5),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${item.quantity} und.',
                        style: TextStyle(
                          color: badgeColor,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, size: 18, color: chevron),
                  ],
                ),

                onTap: () {
                  final product = _findProduct(item.name);
                  if (product == null) return;
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.productDetails, arguments: product);
                },
              ),
            );
          }),

          TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.inventory),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ver todas las alertas'),
                SizedBox(width: 2),
                Icon(Icons.chevron_right, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
