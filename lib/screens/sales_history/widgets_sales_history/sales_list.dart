import 'package:flutter/material.dart';
import '../../../app_routes.dart';
import '../sales_details_screen.dart';
import '../widgets_sales_details/sales_items_list.dart';

class Sale {
  final String invoiceNumber;
  final String clientName;
  final String date;
  final String amount;
  final String productsSummary;

  const Sale(
    this.invoiceNumber,
    this.clientName,
    this.date,
    this.amount,
    this.productsSummary,
  );
}

class SalesList extends StatelessWidget {
  const SalesList({super.key});

  static const List<Sale> _sales = [
    Sale(
      'Factura #F-001248',
      'Genérico',
      '24 Oct 2026 • 11:45 AM',
      'C\$450.00',
      '2x Cuaderno Espiral A4, 1x Bolígrafo azul...',
    ),
    Sale(
      'Factura #F-001247',
      'Instituto Juan XXIII',
      '24 Oct 2026 • 09:15 AM',
      'C\$1,850.00',
      '4x Resma de Papel Bond, 2x Marcador...',
    ),
    Sale(
      'Factura #F-001245',
      'Distribuidora del Norte',
      '23 Oct 2026 • 02:10 PM',
      'C\$2,100.00',
      '3x Resma Papel Bond, 1x Caja Bolígrafos...',
    ),
    Sale(
      'Factura #F-001244',
      'Tienda Escolar Los Cedros',
      '22 Oct 2026 • 11:20 AM',
      'C\$3,400.00',
      '4x Cuaderno Univ. Docena, 2x Marcadores...',
    ),
  ];

  static const Color card = Colors.white;
  static const Color border = Color(0xFFE5E7EB);
  static const Color textPrimary = Color(0xFF1A1F36);
  static const Color textSecondary = Color(0xFF8A94A6);
  static const Color primary = Color(0xFF1B2A5C);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _sales.map((sale) {
        final isLast = sale == _sales.last;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.saleDetails,
              arguments: SaleDetail(
                invoiceNumber: sale.invoiceNumber,
                totalAmount: sale.amount,
                date: sale.date,
                clientName: sale.clientName,
                cashier: 'Don César Admin',
                items: const [
                  SaleLineItem('Cuaderno Espiral A4 (100 hojas)', 'Papelería', 2, 125.00, 250.00),
                  SaleLineItem('Bolígrafo azul Bic Cristal', 'Papelería', 1, 35.00, 35.00),
                  SaleLineItem('Resma de Papel Bond 75g', 'Hojas', 1, 165.00, 165.00),
                ],
                subtotal: 391.30,
                total: 391.00,
                cashGiven: 500.00,
                changeGiven: 109.00,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        sale.invoiceNumber,
                        style: const TextStyle(
                          color: textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      sale.amount,
                      style: const TextStyle(
                        color: primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(color: textSecondary, fontSize: 13),
                    children: [
                      const TextSpan(text: 'Cliente: '),
                      TextSpan(
                        text: sale.clientName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      sale.date,
                      style: const TextStyle(color: textSecondary, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        sale.productsSummary,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: textSecondary, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Ver detalle →',
                      style: TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}