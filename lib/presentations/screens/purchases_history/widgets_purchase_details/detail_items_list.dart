import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import 'detail_item.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class DetailItemsList extends StatelessWidget {
  final PurchaseModel purchase;

  const DetailItemsList({super.key, required this.purchase});

  String _formatCurrency(double value) {
    return 'C\$${value.toStringAsFixed(2).replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ',')}';
  }

  @override
  Widget build(BuildContext context) {
    final detalles = purchase.details.map((item) {
      return DetailItem(
        nombre: item.productName,
        precioTotal: _formatCurrency(item.lineTotal),
        desglose:
            '${item.quantity} unidades x ${_formatCurrency(item.purchasePrice)}',
      );
    }).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Items de la compra', style: AppText.subtitle),
          const SizedBox(height: 12),
          if (detalles.isEmpty)
            const Text('Esta compra no tiene detalles disponibles.',
              style: AppText.bodySecondary,
            )
          else...detalles.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: item,
              ),
            ),
        ],
      ),
    );
  }
}

