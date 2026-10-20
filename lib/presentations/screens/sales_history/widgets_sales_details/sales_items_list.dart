import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SaleLineItem {
  final String name;
  final String category;
  final int quantity;
  final double unitPrice;
  final double subtotal;

  const SaleLineItem(
    this.name,
    this.category,
    this.quantity,
    this.unitPrice,
    this.subtotal,
  );
}

class SalesItemsList extends StatelessWidget {
  final List<SaleLineItem> items;

  const SalesItemsList({super.key, required this.items});

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
              const Icon(Icons.receipt_long_outlined, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text(
                'Ítems facturados',
                style: AppText.subtitle,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
            if (item != items.last) const Divider(height: 20, color: AppColors.border),
          ],
        ],
      ),
    );
  }

  Widget _itemRow(SaleLineItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: AppText.subtitle,
              ),
              const SizedBox(height: 2),
              Text(
                '• ${item.category}',
                style: AppText.caption,
              ),
              const SizedBox(height: 2),
              Text(
                '${item.quantity} un. × C\$${item.unitPrice.toStringAsFixed(2)}',
                style: AppText.caption,
              ),
            ],
          ),
        ),
        Text(
          'C\$${item.subtotal.toStringAsFixed(2)}',
          style: AppText.subtitle,
        ),
      ],
    );
  }
}