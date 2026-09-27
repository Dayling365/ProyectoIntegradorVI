import 'package:flutter/material.dart';

class PurchaseDetailSummary extends StatelessWidget {
  final String subtotal;
  final String totalNeto;
  final String montoPagado;

  const PurchaseDetailSummary({
    super.key,
    required this.subtotal,
    required this.totalNeto,
    required this.montoPagado,
  });

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color success = Color(0xFF16A34A);

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