import 'package:flutter/material.dart';
import '../../models_product/product.dart';

class ProductHeader extends StatelessWidget {
  final Product product;

  const ProductHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final badgeColor = product.inStock ? const Color(0xFF16A34A) : const Color(0xFFF59E0B);
    final badgeBg = product.inStock ? const Color(0xFFDCFCE7) : const Color(0xFFFEF3C7);
    final badgeText = product.inStock ? 'En stock' : 'Stock bajo';

    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF1B2A5C).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.inventory_2_outlined, color: Color(0xFF1B2A5C), size: 28),
        ),
        const SizedBox(height: 10),
        Text(
          product.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36)),
        ),
        const SizedBox(height: 4),
        Text(
          '${product.category} • ${product.subcategory}',
          style: const TextStyle(fontSize: 13, color: Color(0xFF8A94A6)),
        ),
        const SizedBox(height: 2),
        Text(
          'Marca: ${product.brand}',
          style: const TextStyle(fontSize: 13, color: Color(0xFF8A94A6)),
        ),
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