import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseDetailInfo extends StatelessWidget {
  final PurchaseModel purchase;

  const PurchaseDetailInfo({super.key, required this.purchase});

  String _formatCurrency(double value) {
    return 'C\$${value.toStringAsFixed(2).replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ',')}';
  }

  String _formatDate(DateTime value) {
    final monthNames = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];
    final hour = value.hour > 12
        ? value.hour - 12
        : value.hour == 0
            ? 12
            : value.hour;
    final meridiem = value.hour >= 12 ? 'PM' : 'AM';
    final minute = value.minute.toString().padLeft(2, '0');
    return '${value.day} ${monthNames[value.month - 1]} ${value.year} • $hour:$minute $meridiem';
  }

  @override
  Widget build(BuildContext context) {
    final fecha = _formatDate(purchase.purchaseDate);
    final proveedor = purchase.supplierName ?? 'Proveedor no disponible';
    final totalAmount = _formatCurrency(purchase.totalAmount);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FOLIO: Compra #${purchase.id}',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                const Text(
                  'MONTO TOTAL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(totalAmount, style: AppTextTheme.textTheme.displayLarge),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _fila(
            icon: Icons.calendar_today_outlined,
            etiqueta: 'Fecha y hora',
            valor: fecha,
          ),
          const SizedBox(height: 10),
          _fila(
            icon: Icons.local_shipping_outlined,
            etiqueta: 'Proveedor',
            valor: proveedor,
          ),
        ],
      ),
    );
  }

  Widget _fila({
    required IconData icon,
    required String etiqueta,
    required String valor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(etiqueta, style: AppText.bodySecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            valor,
            style: AppText.bodyStrong,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}