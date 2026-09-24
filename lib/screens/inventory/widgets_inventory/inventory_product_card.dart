import 'package:flutter/material.dart';
import '../../models_product/product.dart';

class InventoryProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const InventoryProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final badgeColor = product.inStock ? const Color(0xFF16A34A) : const Color(0xFFF59E0B);
    final badgeBg = product.inStock ? const Color(0xFFDCFCE7) : const Color(0xFFFEF3C7);
    final badgeText = product.inStock ? 'En stock' : 'Stock bajo';

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
                    Text(product.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36))),
                    const SizedBox(height: 2),
                    Text('${product.category} • ${product.subcategory}', style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
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
          Text('C\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B2A5C))),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: const Row(
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