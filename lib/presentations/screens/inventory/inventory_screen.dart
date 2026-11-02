import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/view_status.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import 'widgets_inventory/inventory_product_card.dart';
import 'widgets_inventory/inventory_search_bar.dart';
import 'widgets_inventory/inventory_filters.dart';
import 'widgets_inventory/inventory_pagination.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = context.read<InventoryProvider>();
    _searchController.text = provider.searchQuery;
    _searchController.addListener(() => provider.setSearchQuery(_searchController.text));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchInventory();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearFilters(InventoryProvider provider) {
    _searchController.clear();
    provider.resetFilters();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventoryProvider>();
    final count = provider.totalRecords;

    return AppScaffold(
      currentRoute: AppRoutes.inventory,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Inventario',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36))),
            const SizedBox(height: 4),
            const Text('Consulta y gestiona todos los productos de la papelería.',
                style: TextStyle(fontSize: 13, color: Color(0xFF8A94A6))),
            const SizedBox(height: 16),
            InventorySearchBar(controller: _searchController),
            const SizedBox(height: 14),
            InventoryFilters(
              categories: provider.categories,
              brands: provider.brands,
              statuses: provider.statuses,
              sortOptions: provider.sortOptions,
              category: provider.category,
              brand: provider.brand,
              status: provider.status,
              sortBy: provider.sortBy,
              onCategoryChanged: provider.setCategory,
              onBrandChanged: provider.setBrand,
              onStatusChanged: provider.setStatus,
              onSortChanged: provider.setSortBy,
              onClear: () => _clearFilters(provider),
            ),
            const SizedBox(height: 14),
            if (provider.viewStatus == ViewStatus.success)
              Text('$count ${count == 1 ? 'producto' : 'productos'}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
            const SizedBox(height: 12),
            _buildContent(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(InventoryProvider provider) {
    switch (provider.viewStatus) {
      case ViewStatus.initial:
      case ViewStatus.loading:
        return const LoadingView(message: 'Cargando inventario...');

      case ViewStatus.error:
        return ErrorView(
          message: provider.errorMessage ?? 'No se pudo cargar el inventario.',
          onRetry: provider.fetchInventory,
        );

      case ViewStatus.success:
        if (provider.items.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Text('No se encontraron productos.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF8A94A6))),
            ),
          );
        }
        return Column(
          children: [
            ...provider.items.map((item) => InventoryProductCard(item: item)),
            const SizedBox(height: 8),
            InventoryPagination(
              currentPage: provider.currentPage,
              totalPages: provider.totalPages,
              onPageChanged: provider.goToPage,
            ),
          ],
        );
    }
  }
}
