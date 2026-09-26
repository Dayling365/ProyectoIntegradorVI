import 'package:flutter/material.dart';

class SalesMeta extends StatelessWidget {
  final String date;
  final String clientName;
  final String cashier;

  const SalesMeta({
    super.key,
    required this.date,
    required this.clientName,
    required this.cashier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row(Icons.calendar_today_outlined, 'Fecha y hora', date),
        const SizedBox(height: 10),
        _row(Icons.person_outline, 'Cliente', clientName),
        const SizedBox(height: 10),
        _row(Icons.badge_outlined, 'Cajero', cashier, valueColor: const Color(0xFF2563EB)),
      ],
    );
  }

  Widget _row(IconData icon, String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF8A94A6)),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF8A94A6)),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: valueColor ?? const Color(0xFF1A1F36),
          ),
        ),
      ],
    );
  }
}