import 'package:flutter/material.dart';
import '../../../app_routes.dart';
import '../../sales_history/sales_details_screen.dart';
import '../../sales_history/widgets_sales_details/sales_items_list.dart';

class SaleSeller {
  final String invoiceNumber;
  final String clientName;
  final String date;
  final String amount;
  final String productsSummary;

  const SaleSeller(
    this.invoiceNumber,
    this.clientName,
    this.date,
    this.amount,
    this.productsSummary,
  );
}

class SalesListSeller extends StatelessWidget {
  const SalesListSeller({super.key});

  static const List<SaleSeller> _sales = [
    SaleSeller(
      'Factura #F-001248',
      'General',
      '24 Oct 2026 • 11:45 AM',
      'C\$450.00',
      '2x Cuaderno Espiral A4, 1x Bolígrafo az...',
    ),
    SaleSeller(
      'Factura #F-001247',
      'Institución',
      '24 Oct 2026 • 09:15 AM',
      'C\$1,850.00',
      '4x Resma de Papel Bond...',
    ),
    SaleSeller(
      'Factura #F-001245',
      'General',
      '24 Oct 2026 • 08:30 AM',
      'C\$920.00',
      '1x Mochila Escolar, 2x Cuadernos...',
    ),
    SaleSeller(
      'Factura #F-001241',
      'General',
      '23 Oct 2026 • 05:20 PM',
      'C\$380.00',
      '5x Marcadores, 3x Cartulinas...',
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

        return Container(
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
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, size: 18, color: textSecondary),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'detalle', child: Text('Ver detalle')),
                    ],
                    onSelected: (value) {
                      if (value == 'detalle') {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.saleDetails,
                          arguments: SaleDetail(
                            invoiceNumber: sale.invoiceNumber,
                            totalAmount: sale.amount,
                            date: sale.date,
                            clientName: sale.clientName,
                            cashier: 'Carlos Martínez',
                            items: const [
                              SaleLineItem('Cuaderno Espiral A4 (100 hojas)', 'Papelería', 2, 125.00, 250.00),
                              SaleLineItem('Bolígrafo azul Bic Cristal', 'Papelería', 1, 35.00, 35.00),
                            ],
                            subtotal: 285.00,
                            total: 285.00,
                            cashGiven: 300.00,
                            changeGiven: 15.00,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(color: textSecondary, fontSize: 13),
                  children: [
                    const TextSpan(text: 'Cliente: '),
                    TextSpan(
                      text: sale.clientName,
                      style: const TextStyle(fontWeight: FontWeight.w700, color: textPrimary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 12, color: textSecondary),
                  const SizedBox(width: 4),
                  Text(sale.date, style: const TextStyle(color: textSecondary, fontSize: 12)),
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
                  Text(
                    sale.amount,
                    style: const TextStyle(color: primary, fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Ver recibo →',
                  style: TextStyle(color: primary, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}