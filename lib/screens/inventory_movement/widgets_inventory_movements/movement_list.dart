import 'package:flutter/material.dart';
import 'movement_item.dart';

class MovementList extends StatelessWidget {
  const MovementList({super.key});

  @override
  Widget build(BuildContext context) {
    const Color success = Color(0xFF16A34A);
    const Color danger = Color(0xFFDC2626);
    const Color warning = Color(0xFFF59E0B);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [

        MovementItem(
          producto: 'Cuaderno Espiral A4',
          categoria: 'Papelería',
          fecha: '25/09/2025 • 10:42 AM',
          stockAntes: '20',
          stockDespues: '50',
          motivo: 'Compra',
          motivoIcon: Icons.shopping_bag_outlined,
          etiqueta: 'Entrada',
          etiquetaColor: success,
          etiquetaBg: Color(0x1A16A34A),
        ),

        MovementItem(
          producto: 'Lápiz Grafito HB',
          categoria: 'Escritura',
          fecha: '24/09/2025 • 04:15 PM',
          stockAntes: '100',
          stockDespues: '60',
          motivo: 'Venta',
          motivoIcon: Icons.point_of_sale_outlined,
          etiqueta: 'Salida',
          etiquetaColor: danger,
          etiquetaBg: Color(0x1ADC2626),
        ),

        MovementItem(
          producto: 'Marcador Permanente',
          categoria: 'Escritura',
          fecha: '22/09/2025 • 11:32 AM',
          stockAntes: '15',
          stockDespues: '12',
          motivo: 'Producto dañado',
          motivoIcon: Icons.warning_amber_rounded,
          etiqueta: 'Baja de inventario',
          etiquetaColor: warning,
          etiquetaBg: Color(0x1AF59E0B),
          esAlerta: true,
        ),

        MovementItem(
          producto: 'Goma de borrar Blanca',
          categoria: 'Útiles',
          fecha: '20/09/2025 • 09:20 AM',
          stockAntes: '30',
          stockDespues: '80',
          motivo: 'Compra',
          motivoIcon: Icons.shopping_bag_outlined,
          etiqueta: 'Entrada',
          etiquetaColor: success,
          etiquetaBg: Color(0x1A16A34A),
        ),

        MovementItem(
          producto: 'Calculadora Científica',
          categoria: 'Útiles',
          fecha: '16/09/2025 • 01:05 PM',
          stockAntes: '8',
          stockDespues: '15',
          motivo: 'Devolución',
          motivoIcon: Icons.replay_outlined,
          etiqueta: 'Entrada',
          etiquetaColor: success,
          etiquetaBg: Color(0x1A16A34A),
        ),
      ],
    );
  }
}