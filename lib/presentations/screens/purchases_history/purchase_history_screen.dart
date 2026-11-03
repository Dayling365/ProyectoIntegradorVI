import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import '../../providers/purchase_provider.dart';
import 'widgets_purchase_history/purchase_filters.dart';
import 'widgets_purchase_history/purchase_summary.dart';
import 'widgets_purchase_history/purchase_list.dart';
import 'widgets_purchase_history/purchase_pagination.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class PurchasesHistoryScreen extends StatefulWidget {
  const PurchasesHistoryScreen({super.key});

  @override
  State<PurchasesHistoryScreen> createState() => _PurchasesHistoryScreenState();
}

class _PurchasesHistoryScreenState extends State<PurchasesHistoryScreen> {
  static const int _itemsPerPage = 10;

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PurchaseProvider>().fetchPurchases();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PurchaseProvider>();
    final filteredPurchases = provider.filteredPurchases;

    final totalPages = filteredPurchases.isEmpty
        ? 1
        : (filteredPurchases.length / _itemsPerPage).ceil();
    final safePage = _currentPage > totalPages ? totalPages : _currentPage;
    final pageItems = filteredPurchases
        .skip((safePage - 1) * _itemsPerPage)
        .take(_itemsPerPage)
        .toList();

    return AppScaffold(
      currentRoute: AppRoutes.purchasesHistory,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historial de Compras',
               style: AppText.heading,
               ),
            const SizedBox(height: 4),
            const Text(
              'Registro cronológico de compras y suministros a proveedores.',
              style: AppText.bodySecondary,
            ),
            PurchaseFilters(
              proveedores: provider.suppliers,
              proveedorSeleccionado: provider.supplierId,
              fechaInicio: provider.startDate,
              fechaFin: provider.endDate,
              ordenSeleccionado: provider.sortOrder,
              onSearchChanged: (texto) {
                provider.searchPurchases(texto);
                setState(() {
                  _currentPage = 1;
                });
              },
              onProveedorChanged: (id) {
                provider.setSupplier(id);
                setState(() {
                  _currentPage = 1;
                });
              },
              onStartDateChanged: (fecha) {
                provider.setDateRange(fecha, provider.endDate);
                setState(() {
                  _currentPage = 1;
                });
              },
              onEndDateChanged: (fecha) {
                provider.setDateRange(provider.startDate, fecha);
                setState(() {
                  _currentPage = 1;
                });
              },
              onSortChanged: (orden) {
                provider.setSortOrder(orden);
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            const SizedBox(height: 16),
            PurchaseSummary(
            total: filteredPurchases.length, onClearFilters: () { provider.resetFilters();
              setState(() { _currentPage = 1;
              });
            },
          ),
            const SizedBox(height: 20),
            if (provider.isLoading && provider.purchases.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (provider.errorMessage != null &&
                provider.purchases.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text( provider.errorMessage ?? 'No se pudo cargar la información.',
                  style: AppText.bodySecondary,
                ),
              )
            else if (pageItems.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Center(
                  child: Text( 'No se encontraron compras.',
                    style: AppText.bodySecondary,
                  ),
                ),
              )
            else
              PurchaseList(purchases: pageItems),
            const SizedBox(height: 20),
            if (filteredPurchases.isNotEmpty)
              PurchasePagination(
                currentPage: safePage,
                totalPages: totalPages,
                onPageChanged: (p) => setState(() => _currentPage = p),
              ),
          ],
        ),
      ),
    );
  }
}