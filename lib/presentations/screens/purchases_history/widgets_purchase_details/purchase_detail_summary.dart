import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseDetailSummary extends StatelessWidget {
  final PurchaseModel purchase;

  const PurchaseDetailSummary({
    super.key, required this.purchase});

  String _formatCurrency(double value) {
    return 'C\$${value.toStringAsFixed(2).replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('RESUMEN DE COMPRA', 
          style: AppText.overline,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Text('Cantidad de productos', 
              style: AppText.bodySecondary
              ),
              const Spacer(),
              Text(
                '${purchase.details.length}',
                style: AppText.bodyStrong,
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Total de la compra', 
              style: AppText.title,
              ),
              const Spacer(),
              Text(
                _formatCurrency(purchase.totalAmount),
                style: AppText.title,
              ),
            ],
          ),
        ],
      ),
    );
  }
}