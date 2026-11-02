import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/data/models/inventory_movement_model.dart';
import 'package:sistema_libreria_app/services/inventory_movement_service.dart';

enum ViewStatus { initial, loading, success, error }

class InventoryMovementProvider extends ChangeNotifier {
  final InventoryMovementService _movementService;

  InventoryMovementProvider(this._movementService);

  List<InventoryMovementModel> movements = [];

  List<InventoryMovementModel> _filteredMovements = [];
  int? _productId;
  String _searchQuery = '';
  DateTime? _startDate;
  DateTime? _endDate;
  String _movementType = '';
  String _sortOrder = 'newest';

  InventoryMovementModel? _selectedMovement;
  InventoryMovementModel? get selectedMovement => _selectedMovement;

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int? get productId => _productId;
  String get searchQuery => _searchQuery;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String get movementType => _movementType;
  String get sortOrder => _sortOrder;

  List<InventoryMovementModel> get filteredMovements =>
      List.unmodifiable(_filteredMovements);

  int get movementCount => _filteredMovements.length;
  bool get hasMovements => _filteredMovements.isNotEmpty;
  bool get isLoading => _viewStatus == ViewStatus.loading;

  Future<void> fetchMovements() async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      if (_startDate != null && _endDate != null) {
        movements = await _movementService.getMovementsByDateRange(
          _startDate!,
          _endDate!,
        );
      } else if (_movementType.isNotEmpty) {
        movements = await _movementService.getMovementsByType(
          _movementType,
        );
      } else if (_productId != null) {
        movements = await _movementService.getMovementsByProductId(
          _productId!,
        );
      } else {
        movements = await _movementService.getAllMovements();
      }

      _applyFilters();
      _viewStatus = ViewStatus.success;
    } catch (e) {
      _errorMessage = 'No se pudieron cargar los movimientos: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> setProductId(int? id) async {
    _productId = id;
    await fetchMovements();
  }

  Future<void> setMovementType(String? type) async {
    _movementType = type == 'Todos' ? '' : type ?? '';
    await fetchMovements();
  }

  Future<void> searchMovements(String query) async {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  Future<void> setDateRange(DateTime? start, DateTime? end) async {
    _startDate = start;
    _endDate = end;
    await fetchMovements();
  }

  void setSortOrder(String order) {
    _sortOrder = order;
    _applyFilters();
    notifyListeners();
  }
  Future<InventoryMovementModel?> getMovementDetails(int id) async {
    _selectedMovement = null;
    _errorMessage = null;
    _viewStatus = ViewStatus.loading;
    notifyListeners();

    try {
      _selectedMovement = await _movementService.getMovementById(id);
      _viewStatus = ViewStatus.success;
      return _selectedMovement;
    } catch (e) {
      _errorMessage = 'No se pudo cargar el detalle del movimiento: $e';
      _viewStatus = ViewStatus.error;
      return null;
    } finally {
      notifyListeners();
    }
  }

  void _applyFilters() {
    final query = _searchQuery.trim().toLowerCase();

    final filteredMovements = movements.where((movement) {
      final matchesProduct =
          _productId == null || movement.productId == _productId;

      final matchesType = _movementType.isEmpty ||
          movement.movementType.toLowerCase() == _movementType.toLowerCase();

      final matchesSearch = query.isEmpty ||
          (movement.productName ?? '').toLowerCase().contains(query) ||
          movement.movementType.toLowerCase().contains(query) ||
          (movement.reason ?? '').toLowerCase().contains(query) ||
          movement.productId.toString().contains(query);

      return matchesProduct && matchesType && matchesSearch;
    }).toList();

    switch (_sortOrder) {
      case 'oldest':
        filteredMovements.sort((a, b) => a.dateTime.compareTo(b.dateTime));
        break;
      case 'newest':
      default:
        filteredMovements.sort((a, b) => b.dateTime.compareTo(a.dateTime));
        break;
    }

    _filteredMovements = filteredMovements;
  }

  Future<void> resetFilters() async {
    _productId = null;
    _searchQuery = '';
    _startDate = null;
    _endDate = null;
    _movementType = '';
    _sortOrder = 'newest';
    await fetchMovements();
  }
}