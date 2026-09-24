import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/purchase_filters.dart';
import 'widgets/purchase_summary.dart';
import 'widgets/purchase_list.dart';
import 'widgets/purchase_pagination.dart';

class PurchasesHistoryScreen extends StatelessWidget {
  const PurchasesHistoryScreen({super.key});

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
              'Registro cronológico de compras y suministros de proveedores.',
              style: TextStyle(
                color: textSecondary,
                fontSize: 13,
              ),
            ),

            const PurchaseFilters(),

            const SizedBox(height: 16),

            const PurchaseSummary(total: 386),

            const SizedBox(height: 20),

            const PurchaseList(),

            const SizedBox(height: 20),
            const PurchasePagination(paginaActual: 1, totalPaginas: 20),
          ],
        ),
      ),
    );
  }
}