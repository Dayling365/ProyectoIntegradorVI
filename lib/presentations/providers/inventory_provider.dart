import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/data/models/inventory_model.dart';
import 'package:sistema_libreria_app/data/models/paged_response_model.dart';
import 'package:sistema_libreria_app/presentations/providers/view_status.dart';
import 'package:sistema_libreria_app/services/inventory_service.dart';

class InventoryProvider extends ChangeNotifier {
  final InventoryService _inventoryService;

  InventoryProvider(this._inventoryService);

  static const int pageSize = 10;

  List<InventoryModel> _allItems = [];
  PagedResponse<InventoryModel> _page = PagedResponse.empty();

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String _searchQuery = '';
  String _category = InventoryService.all;
  String _brand = InventoryService.all;
  String _status = InventoryService.all;
  String _sortBy = InventoryService.sortByName;
  int _currentPage = 1;

  String get searchQuery => _searchQuery;
  String get category => _category;
  String get brand => _brand;
  String get status => _status;
  String get sortBy => _sortBy;

  List<InventoryModel> get items => List.unmodifiable(_page.items);
  int get currentPage => _page.pageNumber;
  int get totalPages => _page.totalPages;
  int get totalRecords => _page.totalRecords;
  bool get isLoading => _viewStatus == ViewStatus.loading;

  List<String> get categories => _inventoryService.categoriesOf(_allItems);
  List<String> get brands => _inventoryService.brandsOf(_allItems);
  List<String> get statuses => InventoryService.statuses;
  List<String> get sortOptions => InventoryService.sortOptions;

  Future<void> fetchInventory() async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _allItems = await _inventoryService.getAllInventory();
      _applyFilters();
      _viewStatus = ViewStatus.success;
    } on AppException catch (e) {
      _errorMessage = e.message;
      _viewStatus = ViewStatus.error;
    } catch (e) {
      _errorMessage = 'No se pudo cargar el inventario: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _resetPageAndApply();
  }

  void setCategory(String value) {
    _category = value;
    _resetPageAndApply();
  }

  void setBrand(String value) {
    _brand = value;
    _resetPageAndApply();
  }

  void setStatus(String value) {
    _status = value;
    _resetPageAndApply();
  }

  void setSortBy(String value) {
    _sortBy = value;
    _resetPageAndApply();
  }

  void goToPage(int page) {
    _currentPage = page;
    _applyFilters();
    notifyListeners();
  }
void resetFilters() {
    _searchQuery = '';
    _category = InventoryService.all;
    _brand = InventoryService.all;
    _status = InventoryService.all;
    _sortBy = InventoryService.sortByName;
    _resetPageAndApply();
  }

  void _resetPageAndApply() {
    _currentPage = 1;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    final filtered = _inventoryService.filter(
      _allItems,
      query: _searchQuery,
      category: _category,
      brand: _brand,
      status: _status,
      sortBy: _sortBy,
    );
    _page = _inventoryService.paginate(
      filtered,
      pageNumber: _currentPage,
      pageSize: pageSize,
    );
    _currentPage = _page.pageNumber;
  }
}


