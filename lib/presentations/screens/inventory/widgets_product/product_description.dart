import 'package:flutter/material.dart';
import '../../../../data/models/inventory_model.dart';

class ProductDescription extends StatelessWidget {
  final InventoryModel item;

  const ProductDescription({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('DESCRIPCIÓN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF8A94A6), letterSpacing: 0.5)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Text(item.description ?? 'Sin descripción.', style: const TextStyle(fontSize: 13, color: Color(0xFF1A1F36), height: 1.5)),
        ),
      ],
    );
  }
}