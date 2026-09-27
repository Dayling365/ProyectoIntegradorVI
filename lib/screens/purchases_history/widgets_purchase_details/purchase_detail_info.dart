import 'package:flutter/material.dart';

class PurchaseDetailInfo extends StatelessWidget {
  final String fecha;
  final String proveedor;
  final String registradoPor;

  const PurchaseDetailInfo({
    super.key,
    required this.fecha,
    required this.proveedor,
    required this.registradoPor,
  });

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color success = Color(0xFF16A34A);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _fila(
          icon: Icons.calendar_today_outlined,
          etiqueta: 'Fecha y hora',
          valor: fecha,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),

        const SizedBox(height: 10),

        _fila(
          icon: Icons.local_shipping_outlined,
          etiqueta: 'Proveedor',
          valor: proveedor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            const Icon(
              Icons.person_outline,
              size: 16,
              color: textSecondary,
            ),
            const SizedBox(width: 8),
            const Text('Registrado por',
              style: TextStyle(fontSize: 13, color: textSecondary),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                registradoPor,
                style: const TextStyle(
                  fontSize: 12,
                  color: success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _fila({
    required IconData icon,
    required String etiqueta,
    required String valor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: textSecondary),
        const SizedBox(width: 8),
        Text(
          etiqueta,
          style: TextStyle(fontSize: 13, color: textSecondary),
        ),
        const Spacer(),
        Text(
          valor,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
      ],
    );
  }
}