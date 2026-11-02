import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../../data/models/inventory_model.dart';

class ProductHeader extends StatelessWidget {
  final InventoryModel item;

  const ProductHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final badgeColor = item.isLowStock ? AppColors.warning : AppColors.success;
    final badgeBg = item.isLowStock ? AppColors.warningBackground : AppColors.successBackground;
    final badgeText = item.isLowStock ? 'Stock bajo' : 'En stock';
    final subtitle = [item.categoryName, item.variantLabel]
        .whereType<String>()
        .where((value) => value.isNotEmpty)
        .join(' • ');

    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.inventory_2_outlined, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 10),
        Text(
          item.productName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
        if (item.brandName != null) ...[
          const SizedBox(height: 2),
          Text(
            'Marca: ${item.brandName}',
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 6, color: badgeColor),
              const SizedBox(width: 4),
              Text(badgeText, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: badgeColor)),
            ],
          ),
        ),
      ],
    );
  }
}
