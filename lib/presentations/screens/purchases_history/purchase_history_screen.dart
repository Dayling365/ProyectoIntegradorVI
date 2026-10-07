import 'package:flutter/material.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_purchase_history/purchase_filters.dart';
import 'widgets_purchase_history/purchase_summary.dart';
import 'widgets_purchase_history/purchase_list.dart';
import 'widgets_purchase_history/purchase_pagination.dart';

class PurchasesHistoryScreen extends StatefulWidget {
  const PurchasesHistoryScreen({super.key});

  @override
  State<PurchasesHistoryScreen> createState() => _PurchasesHistoryScreenState();
}

class _PurchasesHistoryScreenState extends State<PurchasesHistoryScreen> {
  int _currentPage = 1;
  final int _totalPages = 5;
  String _proveedorFiltro = 'Todos';

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return AppScaffold(
      currentRoute: AppRoutes.purchasesHistory,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historial de Compras',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Registro cronológico de compras y suministros a proveedores.',
              style: TextStyle(
                color: textSecondary,
                fontSize: 13,
              ),
            ),

            PurchaseFilters(
              onProveedorChanged: (proveedor) {
                setState(() => _proveedorFiltro = proveedor);
              },
            ),

            const SizedBox(height: 16),

            const PurchaseSummary(total: 50),

            const SizedBox(height: 20),

            PurchaseList(
              proveedorFiltro: _proveedorFiltro,
              currentPage: _currentPage,
            ),

            const SizedBox(height: 20),
            PurchasePagination(
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