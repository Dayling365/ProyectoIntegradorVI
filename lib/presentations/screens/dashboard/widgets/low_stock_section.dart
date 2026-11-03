import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/core/constant/app_routes.dart';
import 'package:sistema_libreria_app/data/models/inventory_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class LowStockSection extends StatelessWidget {
  final List<InventoryModel> items;
  final bool isLoading;

  const LowStockSection({
    super.key,
    required this.items,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: AppColors.errorBackground,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(13),
              ),
            ),
            child: const Text(
              'Alertas de bajo stock',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            )
          else if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'No hay productos con stock bajo.',
                style: AppText.bodySecondary,
              ),
            )
          else
            ...items.take(5).map(
              (item) => ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColors.errorBackground,
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.error,
                  ),
                ),
                title: Text(item.productName, style: AppText.subtitle),
                subtitle: Text(
                  item.variantLabel.isEmpty
                      ? item.categoryName ?? 'Inventario'
                      : item.variantLabel,
                  style: AppText.caption,
                ),
                trailing: Text(
                  '${item.unitsInStock} und.',
                  style: const TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.productDetails,
                    arguments: item.productId,
                  );
                },
              ),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.alertStock);
            },
            child: const Text('Ver todas las alertas'),
          ),
        ],
      ),
    );
  }
}