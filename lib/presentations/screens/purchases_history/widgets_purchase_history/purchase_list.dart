import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import 'purchase_item.dart';

class PurchaseList extends StatelessWidget {
  final List<PurchaseModel> purchases;

  const PurchaseList({super.key, required this.purchases});

  String _formatDate(DateTime date) {
    final months = [
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
    final hour = date.hour > 12
        ? date.hour - 12
        : date.hour == 0
        ? 12
        : date.hour;
    final suffix = date.hour >= 12 ? 'PM' : 'AM';
    final minute = date.minute.toString().padLeft(2, '0');

    return '${date.day} ${months[date.month - 1]} ${date.year} • $hour:$minute $suffix';
  }

  String _formatCurrency(double value) {
    return 'C\$${value.toStringAsFixed(2).replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: purchases.map((purchase) {
        return PurchaseItem(
          id: purchase.id,
          codigo: 'Compra #${purchase.id}',
          proveedor: purchase.supplierName ?? 'Proveedor no disponible',
          fecha: _formatDate(purchase.purchaseDate),
          monto: _formatCurrency(purchase.totalAmount),
        );
      }).toList(),
    );
  }
}
