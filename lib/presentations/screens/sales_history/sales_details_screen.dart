import 'package:flutter/material.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_sales_details/sales_summary.dart';
import 'widgets_sales_details/sales_meta.dart';
import 'widgets_sales_details/sales_items_list.dart';
import 'widgets_sales_details/sales_settlement.dart';
import 'widgets_sales_details/back_to_sales_history_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class SaleDetail {
  final String invoiceNumber;
  final String totalAmount;
  final String date;
  final String clientName;
  final String seller;
  final List<SaleLineItem> items;
  final double subtotal;
  final double total;
  final double cashGiven;
  final double changeGiven;

  const SaleDetail({
    required this.invoiceNumber,
    required this.totalAmount,
    required this.date,
    required this.clientName,
    required this.seller,
    required this.items,
    required this.subtotal,
    required this.total,
    required this.cashGiven,
    required this.changeGiven,
  });
}

class SalesDetailsScreen extends StatelessWidget {
  const SalesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sale = ModalRoute.of(context)!.settings.arguments as SaleDetail;

    return AppScaffold(
      currentRoute: AppRoutes.saleDetails,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalle de Venta',
              style: AppText.value,
            ),
            const SizedBox(height: 4),
            const Text(
              'Comprobante y desglose de factura emitida.',
              style: AppText.caption,
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SalesSummary(
                    invoiceNumber: sale.invoiceNumber,
                    totalAmount: sale.totalAmount,
                  ),
                  const SizedBox(height: 16),
                  SalesMeta(
                    date: sale.date,
                    clientName: sale.clientName,
                    seller: sale.seller,  
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            SalesItemsList(items: sale.items),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: SalesSettlement(
                subtotal: sale.subtotal,
                total: sale.total,
                cashGiven: sale.cashGiven,
                changeGiven: sale.changeGiven,
              ),
            ),
            const SizedBox(height: 24),

            const BackToSalesHistoryButton(),
          ],
        ),
      ),
    );
  }
}