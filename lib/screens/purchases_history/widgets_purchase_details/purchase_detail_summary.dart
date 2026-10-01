import 'package:flutter/material.dart';

class PurchaseDetailSummary extends StatelessWidget {
  final String codigo;

  const PurchaseDetailSummary({
    super.key,
    required this.codigo,
  });

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color success = Color(0xFF16A34A);

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
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('RESUMEN DE LIQUIDACIÓN',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textSecondary,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Text('Subtotal',
                style: TextStyle(fontSize: 13, color: textSecondary),
              ),
              const Spacer(),
              Text(
                subtotal,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(),

          const SizedBox(height: 4),

          Row(
            children: [
              const Text('Total Neto',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,),
              ),
              const Spacer(),
              Text(
                totalNeto,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Text('Monto pagado:',
                style: TextStyle(fontSize: 13, color: textSecondary),
              ),
              const SizedBox(width: 6),
              Text(
                montoPagado,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: success,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}