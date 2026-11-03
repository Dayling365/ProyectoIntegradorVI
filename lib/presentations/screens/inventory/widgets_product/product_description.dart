import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../../data/models/inventory_model.dart';

class ProductDescription extends StatelessWidget {
  final InventoryModel item;

  const ProductDescription({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('DESCRIPCIÓN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary, letterSpacing: 0.5)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(item.description ?? 'Sin descripción.', style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, height: 1.5)),
        ),
      ],
    );
  }
}