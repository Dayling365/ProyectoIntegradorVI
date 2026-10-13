import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseDetailSummary extends StatelessWidget {
  final String codigo;

  const PurchaseDetailSummary({
    super.key,
    required this.codigo,
  });

  @override
  Widget build(BuildContext context) {

    String subtotal = '';
    String totalNeto = '';
    String montoPagado = '';

    switch (codigo) {
      case 'Compra #CP-2026-088':
        subtotal = 'C\$5,608.70';
        totalNeto = 'C\$6,450.00';
        montoPagado = 'C\$6,450.00';
        break;

      case 'Compra #CP-2026-087':
        subtotal = 'C\$3,780.00';
        totalNeto = 'C\$4,120.00';
        montoPagado = 'C\$4,120.00';
        break;

      case 'Compra #CP-2026-086':
        subtotal = 'C\$8,900.00';
        totalNeto = 'C\$8,900.00';
        montoPagado = 'C\$8,900.00';
        break;
    }

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

          const Text('RESUMEN DE LIQUIDACIÓN',
            style: AppText.overline,
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Text('Subtotal',
                style: AppText.bodySecondary,
              ),
              const Spacer(),
              Text(
                subtotal,
                style: AppText.bodyStrong,
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(),

          const SizedBox(height: 4),

          Row(
            children: [
              const Text('Total Neto',
                style: AppText.title,
              ),
              const Spacer(),
              Text(
                totalNeto,
                style: AppText.title,
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Text('Monto pagado:',
                style: AppText.bodySecondary,
              ),
              const SizedBox(width: 6),
              Text(
                montoPagado,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}