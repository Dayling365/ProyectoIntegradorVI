import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_libreria_app/presentations/providers/inventory_movement_provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';
import 'widgets_inventory_movements/movement_filters.dart';
import 'widgets_inventory_movements/movement_summary.dart';
import 'widgets_inventory_movements/movement_list.dart';
import 'widgets_inventory_movements/movement_pagination.dart';

class InventoryMovementScreen extends StatefulWidget {
  const InventoryMovementScreen({super.key});

  @override
  State<InventoryMovementScreen> createState() =>
      _InventoryMovementScreenState();
}

class _InventoryMovementScreenState extends State<InventoryMovementScreen> {
  static const int _itemsPerPage = 10;

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InventoryMovementProvider>().fetchMovements();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventoryMovementProvider>();
    final filteredMovements = provider.filteredMovements;

    final totalPages = filteredMovements.isEmpty
        ? 1
        : (filteredMovements.length / _itemsPerPage).ceil();
    final safePage = _currentPage > totalPages ? totalPages : _currentPage;
    final pageItems = filteredMovements
        .skip((safePage - 1) * _itemsPerPage)
        .take(_itemsPerPage)
        .toList();

    return AppScaffold(
      currentRoute: AppRoutes.inventoryMovement,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Movimiento de Inventario',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
            const Text(
              'Consulta el historial de entradas, salidas y bajas de inventario.',
              style: AppText.bodySecondary,
            ),
            MovementFilters(
              initialSearch: provider.searchQuery,
              startDate: provider.startDate,
              endDate: provider.endDate,
              selectedType: provider.movementType.isEmpty
                  ? 'Todos'
                  : provider.movementType,
              selectedSort: provider.sortOrder,
              onSearchChanged: (texto) {
                provider.searchMovements(texto);
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
              onTypeChanged: (tipo) {
                provider.setMovementType(tipo);
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
            MovementSummary(
              total: filteredMovements.length,
              onClearFilters: () {
                provider.resetFilters();
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            const SizedBox(height: 12),
            if (provider.isLoading && provider.movements.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (provider.errorMessage != null && provider.movements.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  provider.errorMessage!,
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
                    'No se encontraron movimientos.',
                    style: AppText.bodySecondary,
                  ),
                ),
              )
            else
              MovementList(movements: pageItems),
            const SizedBox(height: 16),
            if (filteredMovements.isNotEmpty)
              MovementPagination(
                currentPage: safePage,
                totalPages: totalPages,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
