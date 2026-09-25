import 'package:flutter/material.dart';
import '../../models_product/product.dart';

class ProductStats extends StatelessWidget {
  final Product product;

  const ProductStats({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatBox(label: 'PRECIO UNITARIO', value: 'C\$${product.price.toStringAsFixed(2)}')),
        const SizedBox(width: 12),
        Expanded(child: _StatBox(label: 'EXISTENCIAS', value: '${product.stock} unidades')),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF8A94A6), letterSpacing: 0.5)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B2A5C))),
        ],
      ),
    );
  }
}