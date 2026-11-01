import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import 'package:sistema_libreria_app/data/models/supplier_model.dart';
import 'package:sistema_libreria_app/services/purchase_service.dart';
import 'package:sistema_libreria_app/services/supplier_service.dart';

enum ViewStatus { initial, loading, success, error }

class PurchaseProvider extends ChangeNotifier {
  final PurchaseService _purchaseService;
  final SupplierService _supplierService;

  PurchaseProvider(this._purchaseService, this._supplierService);

  List<PurchaseModel> purchases = [];
  List<SupplierModel> suppliers = [];

  List<PurchaseModel> _filteredPurchases = [];
  int? _supplierId;
  String _searchQuery = '';
  DateTime? _startDate;
  DateTime? _endDate;
  String _sortOrder = 'newest';

  PurchaseModel? _selectedPurchase;
  PurchaseModel? get selectedPurchase => _selectedPurchase;

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int? get supplierId => _supplierId;
  String get searchQuery => _searchQuery;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String get sortOrder => _sortOrder;

  List<PurchaseModel> get filteredPurchases =>
      List.unmodifiable(_filteredPurchases);

  int get purchaseCount => _filteredPurchases.length;
  bool get hasPurchases => _filteredPurchases.isNotEmpty;
  bool get isLoading => _viewStatus == ViewStatus.loading;

  Future<void> loadSuppliers() async {
    try {
      suppliers = await _supplierService.getAllSuppliers();
      notifyListeners();
    } catch (e) {
      _errorMessage = 'No se pudieron cargar los proveedores: $e';
      notifyListeners();
    }
  }

  Future<void> fetchPurchases() async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      await loadSuppliers();

      if (_startDate != null && _endDate != null) {
        purchases = await _purchaseService.getPurchasesByDateRange(
          _startDate!,
          _endDate!,
        );
      } else {
        purchases = await _purchaseService.getAllPurchases();
      }

      _applyFilters();
      _viewStatus = ViewStatus.success;
    } catch (e) {
      _errorMessage = 'No se pudieron cargar las compras: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> setSupplier(int? id) async {
    _supplierId = id;
    _applyFilters();
    notifyListeners();
  }

  Future<void> searchPurchases(String query) async {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  Future<void> setDateRange(DateTime? start, DateTime? end) async {
    _startDate = start;
    _endDate = end;
    await fetchPurchases();
  }

  void setSortOrder(String order) {
    _sortOrder = order;
    _applyFilters();
    notifyListeners();
  }

  Future<PurchaseModel?> getPurchaseDetails(int id) async {
    _selectedPurchase = null;
    _errorMessage = null;
    _viewStatus = ViewStatus.loading;
    notifyListeners();

    try {
      _selectedPurchase = await _purchaseService.getPurchaseDetailsById(id);
      _viewStatus = ViewStatus.success;
      return _selectedPurchase;
    } catch (e) {
      _errorMessage = 'No se pudo cargar el detalle: $e';
      _viewStatus = ViewStatus.error;
      return null;
    } finally {
      notifyListeners();
    }
  }

  void _applyFilters() {
    final query = _searchQuery.trim().toLowerCase();

    _filteredPurchases = purchases.where((purchase) {
      final matchesSupplier =
          _supplierId == null || purchase.supplierId == _supplierId;

      final matchesSearch = query.isEmpty ||
          (purchase.supplierName ?? '').toLowerCase().contains(query);

      return matchesSupplier && matchesSearch;
    }).toList();

    switch (_sortOrder) {
      case 'oldest':
        _filteredPurchases.sort(
          (a, b) => a.purchaseDate.compareTo(b.purchaseDate),
        );
        break;
      case 'amountAsc':
        _filteredPurchases.sort(
          (a, b) => a.totalAmount.compareTo(b.totalAmount),
        );
        break;
      case 'amountDesc':
        _filteredPurchases.sort(
          (a, b) => b.totalAmount.compareTo(a.totalAmount),
        );
        break;
      case 'newest':
      default:
        _filteredPurchases.sort(
          (a, b) => b.purchaseDate.compareTo(a.purchaseDate),
        );
    }
  }

  Future<void> resetFilters() async {
    _supplierId = null;
    _searchQuery = '';
    _startDate = null;
    _endDate = null;
    _sortOrder = 'newest';
    await fetchPurchases();
  }
}