import 'package:flutter/material.dart';
import '../../../../data/models/inventory_model.dart';
import '../../../../core/constant/app_routes.dart';

class InventoryProductCard extends StatelessWidget {
  final InventoryModel item;

  const InventoryProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final badgeColor = item.isLowStock ? const Color(0xFFF59E0B) : const Color(0xFF16A34A);
    final badgeBg = item.isLowStock ? const Color(0xFFFEF3C7) : const Color(0xFFDCFCE7);
    final badgeText = item.isLowStock ? 'Stock bajo' : 'En stock';
    final subtitle = [item.categoryName, item.variantLabel]
        .whereType<String>()
        .where((value) => value.isNotEmpty)
        .join(' • ');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
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
                    Text(item.productName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36))),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B2A5C))),
          const SizedBox(height: 8),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.productDetails, arguments: item.productId),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ver detalle', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF2563EB))),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 12, color: Color(0xFF2563EB)),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
