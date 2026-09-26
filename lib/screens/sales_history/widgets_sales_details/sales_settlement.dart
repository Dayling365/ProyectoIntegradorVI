import 'package:flutter/material.dart';

class SalesSettlement extends StatelessWidget {
  final double subtotal;
  final double total;
  final double cashGiven;
  final double changeGiven;

  const SalesSettlement({
    super.key,
    required this.subtotal,
    required this.total,
    required this.cashGiven,
    required this.changeGiven,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESUMEN DE LIQUIDACIÓN',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8A94A6),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        _row('Subtotal', 'C\$${subtotal.toStringAsFixed(2)}'),
        const SizedBox(height: 8),
        _row(
          'Total Neto',
          'C\$${total.toStringAsFixed(2)}',
          bold: true,
          valueColor: const Color(0xFF1B2A5C),
          fontSize: 16,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            children: [
              _row('Efectivo entregado:', 'C\$${cashGiven.toStringAsFixed(2)}', bold: true),
              const SizedBox(height: 6),
              _row(
                'Cambio devuelto:',
                'C\$${changeGiven.toStringAsFixed(2)}',
                bold: true,
                valueColor: const Color(0xFF16A34A),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String label, String value, {bool bold = false, Color? valueColor, double fontSize = 13}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF8A94A6)),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor ?? const Color(0xFF1A1F36),
          ),
        ),
      ],
    );
  }
}