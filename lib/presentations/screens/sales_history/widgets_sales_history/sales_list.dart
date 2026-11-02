import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/sale_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesList extends StatelessWidget {
  final List<SaleModel> sales;

  const SalesList({
    super.key,
    required this.sales,
  });

  String _formatMoney(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final whole = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    return 'C\$${whole}.${parts[1]}';
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sales.asMap().entries.map((entry) {
        final index = entry.key;
        final sale = entry.value;
        final isLast = index == sales.length - 1;

        return Container(
          margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Venta #${sale.id}',
                      style: AppText.title,
                    ),
                  ),
                  Text(
                    _formatMoney(sale.totalAmount),
                    style: AppText.titlePrimary,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text.rich(
                TextSpan(
                  style: AppText.bodySecondary,
                  children: [
                    const TextSpan(text: 'Cliente: '),
                    TextSpan(
                      text: sale.costumerTypeName ?? 'Sin tipo',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 12,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(sale.saleDate),
                    style: AppText.caption,
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}