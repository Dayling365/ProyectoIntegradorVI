import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/sale_detail_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesItemsList extends StatelessWidget {
  final List<SaleDetailModel> items;

  const SalesItemsList({
    super.key,
    required this.items,
  });

  String _dinero(double valor) => 'C\$${valor.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.receipt_long_outlined,
                size: 16,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              const Text('Ítems facturados', style: AppText.subtitle),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${items.length} líneas',
                  style: AppText.overline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final item in items) ...[
            _itemRow(item),
            if (item != items.last)
              const Divider(height: 20, color: AppColors.border),
          ],
        ],
      ),
    );
  }

  Widget _itemRow(SaleDetailModel item) {
    final variante = [
      item.colorName,
      item.presentationName,
    ].where((valor) => valor != null && valor.isNotEmpty).join(' · ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.productName, style: AppText.subtitle),
              if (variante.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(variante, style: AppText.caption),
              ],
              const SizedBox(height: 2),
              Text(
                '${item.quantity} un. × ${_dinero(item.salePrice)}',
                style: AppText.caption,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          _dinero(item.lineTotal),
          style: AppText.subtitle,
        ),
      ],
    );
  }
}