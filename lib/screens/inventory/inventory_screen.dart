import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import '../models_product/product.dart';
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
  int _currentPage = 1;
  final int _totalPages = 39;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            InventoryFilters(onClear: () => setState(() => _searchController.clear())),
            const SizedBox(height: 14),
            const Text('1,248 productos', style: TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
            const SizedBox(height: 12),
            ...demoProducts.map(
              (p) => InventoryProductCard(
                product: p,
                onTap: () => Navigator.pushNamed(context, AppRoutes.productDetails),
              ),
            ),
            const SizedBox(height: 8),
            InventoryPagination(
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