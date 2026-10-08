import 'package:flutter/material.dart';
import 'purchase_item.dart';

class PurchaseList extends StatelessWidget {
  final String proveedorFiltro;
  final int currentPage;

  const PurchaseList({
    super.key,
    required this.proveedorFiltro,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final compras = [
      const PurchaseItem(
        codigo: 'Compra #CP-2026-088',
        proveedor: 'Distribuidora Faber S.A.',
        fecha: '23 Oct 2026 • 11:45 AM',
        monto: 'C\$6,450.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-087',
        proveedor: 'Útiles y Tintas del Pacífico',
        fecha: '21 Oct 2026 • 09:15 AM',
        monto: 'C\$4,120.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-086',
        proveedor: 'Editorial Cervantes',
        fecha: '18 Oct 2026 • 04:30 PM',
        monto: 'C\$8,900.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-085',
        proveedor: 'Distribuidora Hispamer',
        fecha: '15 Oct 2026 • 02:20 PM',
        monto: 'C\$3,250.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-084',
        proveedor: 'Papelería La Universal, Managua',
        fecha: '12 Oct 2026 • 10:05 AM',
        monto: 'C\$2,780.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-083',
        proveedor: 'Distribuidora Cultural Nicaragüense',
        fecha: '10 Oct 2026 • 03:45 PM',
        monto: 'C\$5,600.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-082',
        proveedor: 'Comercial El Progreso, León',
        fecha: '08 Oct 2026 • 09:30 AM',
        monto: 'C\$4,890.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-081',
        proveedor: 'Suministros de Oficina Masaya',
        fecha: '05 Oct 2026 • 11:15 AM',
        monto: 'C\$1,950.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-080',
        proveedor: 'Imprenta y Papelería San Rafael',
        fecha: '03 Oct 2026 • 04:00 PM',
        monto: 'C\$7,320.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-079',
        proveedor: 'Distribuidora Rodríguez Hermanos',
        fecha: '30 Sep 2026 • 01:10 PM',
        monto: 'C\$3,600.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-078',
        proveedor: 'Grupo Lanica Comercial',
        fecha: '27 Sep 2026 • 10:40 AM',
        monto: 'C\$2,100.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-077',
        proveedor: 'Editorial UCA',
        fecha: '24 Sep 2026 • 03:25 PM',
        monto: 'C\$6,080.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-076',
        proveedor: 'Comercial Granada Office',
        fecha: '21 Sep 2026 • 09:50 AM',
        monto: 'C\$4,470.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-075',
        proveedor: 'Distribuidora Textos Escolares de Estelí',
        fecha: '18 Sep 2026 • 02:15 PM',
        monto: 'C\$1,580.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-074',
        proveedor: 'Casa del Libro Nicaragua',
        fecha: '15 Sep 2026 • 11:30 AM',
        monto: 'C\$8,250.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-073',
        proveedor: 'Distribuidora Papelera de Matagalpa',
        fecha: '12 Sep 2026 • 04:45 PM',
        monto: 'C\$3,920.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-072',
        proveedor: 'PRINTCO Nicaragua',
        fecha: '09 Sep 2026 • 10:20 AM',
        monto: 'C\$2,460.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-071',
        proveedor: 'Librería Jardín, Managua',
        fecha: '06 Sep 2026 • 01:05 PM',
        monto: 'C\$5,900.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-070',
        proveedor: 'ALPSA Nicaragua',
        fecha: '03 Sep 2026 • 09:15 AM',
        monto: 'C\$4,150.00',
      ),

      const PurchaseItem(
        codigo: 'Compra #CP-2026-069',
        proveedor: 'Distribuidora Internacional de Libros (DILSA)',
        fecha: '31 Ago 2026 • 03:30 PM',
        monto: 'C\$2,730.00',
      ),
    ];

    final comprasFiltradas = proveedorFiltro == 'Todos'
        ? compras
        : compras
            .where((item) => item.proveedor == proveedorFiltro)
            .toList();

            final inicio = (currentPage - 1) * 10;
            final fin = inicio + 10;

            final comprasPagina = comprasFiltradas.sublist(
              inicio,
              fin > comprasFiltradas.length ? comprasFiltradas.length : fin,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comprasPagina,
    );

  }
}