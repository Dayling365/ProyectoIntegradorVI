import 'package:flutter/material.dart';
import '../../../../data/models/inventory_model.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class InventoryProductCard extends StatelessWidget {
  final InventoryModel item;

  const InventoryProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final badgeColor = item.isLowStock ? AppColors.warning : AppColors.success;
    final badgeBg = item.isLowStock ? AppColors.warningBackground : AppColors.successBackground;
    final badgeText = item.isLowStock ? 'Stock bajo' : 'En stock';
    final subtitle = [item.categoryName, item.variantLabel]
        .whereType<String>()
        .where((value) => value.isNotEmpty)
        .join(' • ');

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.productDetails, arguments: item.productId),
      child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 6, color: badgeColor),
                    const SizedBox(width: 4),
                    Text(badgeText, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: badgeColor)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text('C\$${item.salePrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Ver detalle', style: AppText.captionInfo),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 14, color: AppColors.accent),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
