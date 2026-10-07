import 'package:flutter/material.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long_outlined, size: 16, color: Color(0xFF1B2A5C)),
              const SizedBox(width: 8),
              const Text(
                'Ítems facturados',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36)),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${items.length} líneas',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF8A94A6)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final item in items) ...[
            _itemRow(item),
            if (item != items.last) const Divider(height: 20, color: Color(0xFFE2E8F0)),
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
                style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36)),
              ),
              const SizedBox(height: 2),
              Text(
                '• ${item.category}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6)),
              ),
              const SizedBox(height: 2),
              Text(
                '${item.quantity} un. × C\$${item.unitPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6)),
              ),
            ],
          ),
        ),
        Text(
          'C\$${item.subtotal.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: Color(0xFF1A1F36)),
        ),
      ],
    );
  }
}