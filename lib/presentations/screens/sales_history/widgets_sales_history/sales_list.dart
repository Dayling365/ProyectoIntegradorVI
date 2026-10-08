import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_state.dart';
import '../../../../core/constant/app_routes.dart';
import '../sales_data.dart';
import '../sales_details_screen.dart';

class SalesList extends StatelessWidget {
  final List<SaleRecord> sales;

  const SalesList({super.key, required this.sales});

  static const Color card = Colors.white;
  static const Color border = Color(0xFFE5E7EB);
  static const Color textPrimary = Color(0xFF1A1F36);
  static const Color textSecondary = Color(0xFF8A94A6);
  static const Color primary = Color(0xFF1B2A5C);
  static const Color info = Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.watch<AppState>().isAdmin;

    return Column(
      children: sales.map((sale) {
        final isLast = sale == sales.last;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.saleDetails,
              arguments: SaleDetail(
                invoiceNumber: sale.invoiceNumber,
                totalAmount: sale.amount,
                date: sale.dateLabel,
                clientName: sale.clientName,
                seller: sale.sellerName,
                items: sale.items,
                subtotal: sale.subtotal,
                total: sale.total,
                cashGiven: sale.cashGiven,
                changeGiven: sale.change,
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
                if (isAdmin) ...[
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: textSecondary, fontSize: 13),
                      children: [
                        const TextSpan(text: 'Vendedor: '),
                        TextSpan(
                          text: sale.sellerName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      sale.dateLabel,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: textSecondary, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Ver detalle',
                      style: TextStyle(
                        color: info,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, size: 12, color: info),
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