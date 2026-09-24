import 'package:flutter/material.dart';
import 'purchase_item.dart';

class PurchaseList extends StatelessWidget {
  const PurchaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PurchaseItem(
          codigo: 'Compra #CP-2026-088',
          proveedor: 'Distribuidora Faber S.A.',
          fecha: '23 Oct 2026 • 11:45 AM',
          monto: 'C\$6,450.00',
        ),

        PurchaseItem(
          codigo: 'Compra #CP-2026-087',
          proveedor: 'Útiles y Tintas del Pacífico',
          fecha: '21 Oct 2026 • 09:15 AM',
          monto: 'C\$4,120.00',
        ),

        PurchaseItem(
          codigo: 'Compra #CP-2026-086',
          proveedor: 'Editorial Cervantes',
          fecha: '18 Oct 2026 • 04:30 PM',
          monto: 'C\$8,900.00',
        ),
      ],
    );
  }
}