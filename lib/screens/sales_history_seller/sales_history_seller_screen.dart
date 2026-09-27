import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_sales_history_seller/sales_filters_seller.dart';
import 'widgets_sales_history_seller/sales_list_seller.dart';
import 'widgets_sales_history_seller/sales_pagination_seller.dart';

class SalesHistorySellerScreen extends StatefulWidget {
  const SalesHistorySellerScreen({super.key});

  @override
  State<SalesHistorySellerScreen> createState() => _SalesHistorySellerScreenState();
}

class _SalesHistorySellerScreenState extends State<SalesHistorySellerScreen> {
  int _currentPage = 1;
  final int _totalPages = 39;

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color primary = Color(0xFF1B2A5C);

    return AppScaffold(
      currentRoute: AppRoutes.salesHistorySeller,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mis Ventas Realizadas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textPrimary),
            ),
            const SizedBox(height: 4),
            const Text(
              'Registro de facturas y cobros emitidos por tu usuario.',
              style: TextStyle(color: textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 16),

            const SalesFiltersSeller(),

            const SizedBox(height: 12),

            Row(
              children: [
                const Expanded(
                  child: Text(
                    '18 ventas registradas hoy',
                    style: TextStyle(color: textSecondary, fontSize: 12.5),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.close, size: 14, color: primary),
                  label: const Text(
                    'Limpiar filtros',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: primary),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            const SalesListSeller(),

            const SizedBox(height: 16),

            SalesPaginationSeller(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: (p) => setState(() => _currentPage = p),
            ),
          ],
        ),
      ),
    );
  }
}