import 'package:flutter/material.dart';
import 'detail_item.dart';

class DetailItemsList extends StatelessWidget {
  final int totalItems;

  const DetailItemsList({super.key, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2_outlined, size: 16),
              const SizedBox(width: 8),
              const Text(
                'Ítems recibidos / comprados',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                '$totalItems líneas',
                style: const TextStyle(fontSize: 11, color: textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 14),
          const DetailItem(
            nombre: 'Caja Bolígrafos Faber-Castell 0.7mm (50 un.)',
            precioTotal: 'C\$3,200.00',
            categoria: 'Papelería',
            desglose: '4 cajas x C\$800.00',
          ),

          const DetailItem(
            nombre: 'Resma Papel Bond 75g A4 (500 hojas)',
            precioTotal: 'C\$1,800.00',
            categoria: 'Hojas',
            desglose: '10 resmas x C\$180.00',
          ),

          const DetailItem(
            nombre: 'Marcador Permanente Negro Caja (12 un.)',
            precioTotal: 'C\$1,450.00',
            categoria: 'Escritura',
            desglose: '5 cajas x C\$290.00',
          ),
        ],
      ),
    );
  }
}