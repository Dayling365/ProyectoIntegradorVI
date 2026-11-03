import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/core/constant/app_routes.dart';
import 'package:sistema_libreria_app/data/models/sale_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesList extends StatelessWidget {
  final List<SaleModel> sales;

  const SalesList({
    super.key,
    required this.sales,
  });

  String _dinero(double valor) => 'C\$${valor.toStringAsFixed(2)}';

  String _fecha(DateTime fecha) {
    final dia = fecha.day.toString().padLeft(2, '0');
    final mes = fecha.month.toString().padLeft(2, '0');
    return '$dia/$mes/${fecha.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sales.asMap().entries.map((entry) {
        final index = entry.key;
        final sale = entry.value;

        return InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.saleDetails,
              arguments: sale.id,
            );
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: index == sales.length - 1 ? 0 : 12,
            ),
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
                      _dinero(sale.totalAmount),
                      style: AppText.titlePrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Cliente: ${sale.costumerTypeName ?? 'Sin tipo'}',
                  style: AppText.bodySecondary,
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
                    Text(_fecha(sale.saleDate), style: AppText.caption),
                    const Spacer(),
                    const Text('Ver detalle', style: AppText.captionInfo),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: AppColors.accent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}