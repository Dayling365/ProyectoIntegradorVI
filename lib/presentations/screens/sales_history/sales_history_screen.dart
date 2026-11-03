import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/purchase_provider.dart' show ViewStatus;
import '../../providers/sale_provider.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_sales_history/sales_filters.dart';
import 'widgets_sales_history/sales_list.dart';
import 'widgets_sales_history/sales_pagination.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class SalesHistoryScreen extends StatefulWidget {
  const SalesHistoryScreen({super.key});

  @override
  State<SalesHistoryScreen> createState() => _SalesHistoryScreenState();
}

class _SalesHistoryScreenState extends State<SalesHistoryScreen> {
  static const int _itemsperPage = 10;
  int _currentPage = 1;

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SaleProvider>().fetchSales();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<SaleProvider>();
    final filteredSales = provider.filteredSales;

    final totalPages = filteredSales.isEmpty
        ? 1
        : (filteredSales.length / _itemsperPage).ceil();
    final safePage = _currentPage > totalPages ? totalPages : _currentPage;
    final pageItems = filteredSales
        .skip((safePage - 1) * _itemsperPage)
        .take(_itemsperPage)
        .toList();

    return AppScaffold(
      currentRoute: AppRoutes.salesHistory,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historial de Ventas',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
            const Text(
              'Registro cronológico de facturas y ventas realizadas.',
              style: AppText.bodySecondary,
            ),

            SalesFilters(
              tiposCliente: provider.customerTypes,
              tipoClienteSeleccionado: provider.customerTypeId,
              fechaInicio: provider.startDate,
              fechaFin: provider.endDate,
              ordenSeleccionado: provider.sortOrder,
              onSearchChanged: (texto) {
                provider.searchSales(texto);
                setState(() => _currentPage = 1);
              },
              onTipoClienteChanged: (id) {
                provider.setCustomerType(id);
                setState(() => _currentPage = 1);
              },
              onStartDateChanged: (fecha) {
                provider.setDateRange(fecha, provider.endDate);
                setState(() => _currentPage = 1);
              },
              onEndDateChanged: (fecha) {
                provider.setDateRange(provider.startDate, fecha);
                setState(() => _currentPage = 1);
              },
              onSortChanged: (orden) {
                provider.setSortOrder(orden);
                setState(() => _currentPage = 1);
              },
              onClearFilters: () {
                provider.resetFilters();
                setState(() => _currentPage = 1);
              },
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                provider.resetFilters();
                setState(() => _currentPage = 1);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.close, size: 16, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Limpiar filtros',
                    style: AppText.bodyStrongPrimary,
                  ),
                ]
              )
            ),

            const SizedBox(height: 4),
            Text(
              '${filteredSales.length} ventas registradas',
              style: AppText.bodySecondary,
            ),
            const SizedBox(height: 20),
            if (provider.isLoading && provider.sales.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (provider.viewStatus == ViewStatus.error &&
                provider.sales.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  provider.errorMessage ?? 'No se pudieron cargar las ventas.',
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
                  child: Text(
                    'No se encontraron ventas.',
                    style: AppText.bodySecondary,
                  ),
                ),
              )
            else
              SalesList(sales: pageItems),
            const SizedBox(height: 20),
            if (filteredSales.isNotEmpty)
              SalesPagination(
                currentPage: safePage,
                totalPages: totalPages,
                onPageChanged: (pagina) {
                  setState(() => _currentPage = pagina);
                },
              ),
          ],
        ),
      ),
    );
  }
}