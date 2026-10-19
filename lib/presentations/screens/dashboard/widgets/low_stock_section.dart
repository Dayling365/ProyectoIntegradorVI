import 'package:flutter/material.dart';
import '../../models_product/product.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

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


  Color _iconBgFor(String category) {
    switch (category.toLowerCase()) {
      case 'papelería':
        return AppColors.primaryLight;
      case 'útiles':
        return AppColors.errorBackground;
      default:
        return AppColors.warningBackground;
    }
  }

  Color _iconColorFor(String category) {
    switch (category.toLowerCase()) {
      case 'papelería':
        return AppColors.primary;
      case 'útiles':
        return AppColors.error;
      default:
        return AppColors.warningDark;
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              color: AppColors.errorBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: AppColors.error,
                    size: 16,
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    'Alertas de bajo stock',
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ..._items.map((item) {
            final isCritical = item.quantity <= criticalThreshold;
            final badgeBg = isCritical ? AppColors.errorBackground : AppColors.warningBackground;
            final badgeColor = isCritical ? AppColors.error : AppColors.warningDark;
            final isLast = item == _items.last;

            return Container(
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : const Border(
                        bottom: BorderSide(color: AppColors.surfaceMuted),
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
                  style: AppText.subtitle,
                ),

                subtitle: Text(
                  item.category,
                  style: AppText.caption,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
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
             Navigator.of(context).pushNamed(AppRoutes.alertStock),
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