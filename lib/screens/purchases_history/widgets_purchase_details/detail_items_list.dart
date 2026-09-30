import 'package:flutter/material.dart';
import 'detail_item.dart';

class DetailItemsList extends StatelessWidget {
  final String codigo;

  const DetailItemsList({super.key, required this.codigo});

  List<DetailItem> get detalles {
    switch (codigo) {
      case 'Compra #CP-2026-088':
        return const [
          DetailItem(
            nombre: 'Caja Bolígrafos Faber-Castell 0.7mm (50 un.)',
            precioTotal: 'C\$3,200.00',
            categoria: 'Papelería',
            desglose: '4 cajas x C\$800.00',
          ),

          DetailItem(
            nombre: 'Resma Papel Bond 75g A4 (500 hojas)',
            precioTotal: 'C\$1,800.00',
            categoria: 'Hojas',
            desglose: '10 resmas x C\$180.00',
          ),

          DetailItem(
            nombre: 'Marcador Permanente Negro Caja (12 un.)',
            precioTotal: 'C\$1,450.00',
            categoria: 'Escritura',
            desglose: '5 cajas x C\$290.00',
          ),
        ];

      case 'Compra #CP-2026-087':
        return const [
          DetailItem(
            nombre: 'Cuaderno Universitario 100 Hojas',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '20 unidades x C\$60.00',
          ),

          DetailItem(
            nombre: 'Lápiz Grafito HB',
            precioTotal: 'C\$750.00',
            categoria: 'Escritura',
            desglose: '50 unidades x C\$15.00',
          ),

          DetailItem(
            nombre: 'Borrador Blanco Escolar',
            precioTotal: 'C\$450.00',
            categoria: 'Escritura',
            desglose: '30 unidades x C\$15.00',
          ),
        ];

      case 'Compra #CP-2026-086':
        return const [
          DetailItem(
            nombre: 'Diccionario Escolar Español',
            precioTotal: 'C\$2,500.00',
            categoria: 'Libros',
            desglose: '10 unidades x C\$250.00',
          ),

          DetailItem(
            nombre: 'Libro de Matemáticas',
            precioTotal: 'C\$3,600.00',
            categoria: 'Libros',
            desglose: '12 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Libro de Ciencias Naturales',
            precioTotal: 'C\$2,800.00',
            categoria: 'Libros',
            desglose: '10 unidades x C\$280.00',
          ),
        ];

      default:
        return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    final items = detalles;

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
              const Text( 'Ítems recibidos / comprados',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const Spacer(),
              Text( '${items.length} líneas',
                style: const TextStyle(fontSize: 11, color: textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 14),
          ...items,
        ],
      ),
    );
  }
}