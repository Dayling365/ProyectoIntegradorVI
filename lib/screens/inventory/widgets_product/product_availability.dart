import 'package:flutter/material.dart';
import '../../models_product/product.dart';

class ProductAvailability extends StatelessWidget {
  final Product product;

  const ProductAvailability({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 20, color: Color(0xFF16A34A)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, color: Color(0xFF1A1F36)),
                children: [
                  const TextSpan(text: 'Nivel de disponibilidad: '),
                  TextSpan(text: product.availabilityLevel, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text('Min. ${product.minStock}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF8A94A6))),
          ),
        ],
      ),
    );
  }
}