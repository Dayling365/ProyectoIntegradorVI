import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_state.dart';
import '../../../../core/constant/app_routes.dart';
import '../sales_data.dart';
import '../sales_details_screen.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesList extends StatelessWidget {
  final List<SaleRecord> sales;

  const SalesList({super.key, required this.sales});

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
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        sale.invoiceNumber,
                        style: AppText.title,
                      ),
                    ),
                    Text(
                      sale.amount,
                      style: AppText.titlePrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text.rich(
                  TextSpan(
                    style: AppText.bodySecondary,
                    children: [
                      const TextSpan(text: 'Cliente: '),
                      TextSpan(
                        text: sale.clientName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isAdmin) ...[
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      style: AppText.bodySecondary,
                      children: [
                        const TextSpan(text: 'Vendedor: '),
                        TextSpan(
                          text: sale.sellerName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      sale.dateLabel,
                      style:AppText.caption,
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
                        style: AppText.caption,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Ver detalle',
                      style: AppText.captionInfo,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, size: 12, color: AppColors.accent),
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