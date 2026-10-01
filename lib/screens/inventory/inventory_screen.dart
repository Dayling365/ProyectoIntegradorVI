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
  static const int _pageSize = 4;
  static const String _all = 'Todos';
  static const String _defaultSort = 'Más recientes';

  static const List<String> _statuses = [_all, 'En stock', 'Stock bajo'];
  static const List<String> _sortOptions = [
    _defaultSort,
    'Nombre (A-Z)',
    'Precio (menor a mayor)',
    'Precio (mayor a menor)',
  ];

  static final List<String> _categories = _optionsOf((p) => p.category);
  static final List<String> _brands = _optionsOf((p) => p.brand);

  static List<String> _optionsOf(String Function(Product) pick) {
    final values = demoProducts.map(pick).toSet().toList()..sort();
    return [_all, ...values];
  }

  final _searchController = TextEditingController();
  String _query = '';
  int _currentPage = 1;
  String _category = _all;
  String _brand = _all;
  String _status = _all;
  String _sort = _defaultSort;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      final text = _searchController.text;
      if (text != _query) {
        setState(() {
          _query = text;
          _currentPage = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matchesStatus(Product p) {
    switch (_status) {
      case 'En stock':
        return p.stock > p.minStock;
      case 'Stock bajo':
        return p.stock <= p.minStock;
      default:
        return true;
    }
  }

  List<Product> get _filtered {
    final q = _query.trim().toLowerCase();

    final list = demoProducts.where((p) {
      final matchesQuery = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.brand.toLowerCase().contains(q) ||
          p.description.toLowerCase().contains(q);
      final matchesCategory = _category == _all || p.category == _category;
      final matchesBrand = _brand == _all || p.brand == _brand;
      return matchesQuery && matchesCategory && matchesBrand && _matchesStatus(p);
    }).toList();

    switch (_sort) {
      case 'Nombre (A-Z)':
        list.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Precio (menor a mayor)':
        list.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Precio (mayor a menor)':
        list.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
    return list;
  }

  void _setFilter(VoidCallback change) {
    setState(() {
      change();
      _currentPage = 1; 
    });
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _category = _all;
      _brand = _all;
      _status = _all;
      _sort = _defaultSort;
      _currentPage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final totalPages = filtered.isEmpty ? 1 : (filtered.length / _pageSize).ceil();
    final page = _currentPage > totalPages ? totalPages : _currentPage;
    final pageItems = filtered.skip((page - 1) * _pageSize).take(_pageSize).toList();
    final count = filtered.length;

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
              categories: _categories,
              brands: _brands,
              statuses: _statuses,
              sortOptions: _sortOptions,
              category: _category,
              brand: _brand,
              status: _status,
              sortBy: _sort,
              onCategoryChanged: (v) => _setFilter(() => _category = v),
              onBrandChanged: (v) => _setFilter(() => _brand = v),
              onStatusChanged: (v) => _setFilter(() => _status = v),
              onSortChanged: (v) => _setFilter(() => _sort = v),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 14),
            Text('$count ${count == 1 ? 'producto' : 'productos'}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
            const SizedBox(height: 12),
            if (pageItems.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text('No se encontraron productos.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF8A94A6))),
                ),
              )
            else
              ...pageItems.map((p) => InventoryProductCard(product: p)),
            const SizedBox(height: 8),
            if (pageItems.isNotEmpty)
              InventoryPagination(
                currentPage: page,
                totalPages: totalPages,
                onPageChanged: (p) => setState(() => _currentPage = p),
              ),
          ],
        ),
      ),
    );
  }
}