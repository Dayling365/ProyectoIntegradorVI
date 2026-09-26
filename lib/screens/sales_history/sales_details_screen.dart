import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_sales_details/sales_summary.dart';
import 'widgets_sales_details/sales_meta.dart';
import 'widgets_sales_details/sales_items_list.dart';
import 'widgets_sales_details/sales_settlement.dart';
import 'widgets_sales_details/back_to_sales_history_button.dart';

class SaleDetail {
  final String invoiceNumber;
  final String totalAmount;
  final String date;
  final String clientName;
  final String cashier;
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
    required this.cashier,
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
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
            ),
            const SizedBox(height: 4),
            const Text(
              'Comprobante y desglose de factura emitida.',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
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
                    cashier: sale.cashier,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
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