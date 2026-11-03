import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/services/purchase_service.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/services/sale_service.dart';
import 'package:sistema_libreria_app/data/models/inventory_model.dart';
import 'package:sistema_libreria_app/services/inventory_service.dart';

class DashboardProvider extends ChangeNotifier {
  final PurchaseService _purchaseService;
  final SaleService _saleService;
  final InventoryService _inventoryService;

  DashboardProvider(this._purchaseService, this._saleService, this._inventoryService  );

  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int? _purchaseThisMonth;
  int? get purchaseThisMonth => _purchaseThisMonth;

  double? _salesTodayTotal;
  double? get salesTodayTotal => _salesTodayTotal;
  
  List<InventoryModel> _inventoryItems = [];
  List<InventoryModel> get inventoryItems =>
      List.unmodifiable(_inventoryItems);

  int? _unitsInInventory;
  int? get unitsInInventory => _unitsInInventory;

  int? _salesTodayCount;
  int? get salesTodayCount => _salesTodayCount;



  Future<void> load({required bool isAdmin}) async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
    final now = DateTime.now();
    final sales = await _saleService.getAllSales();

    final salesToday = sales.where((sale) =>
        sale.saleDate.year == now.year &&
        sale.saleDate.month == now.month &&
        sale.saleDate.day == now.day).toList();

    _salesTodayCount = salesToday.length;
    _salesTodayTotal = salesToday.fold<double>(
      0,
      (total, sale) => total + sale.totalAmount,
    );

    _inventoryItems = await _inventoryService.getAllInventory();
    _unitsInInventory = _inventoryItems.fold<int>(
      0,
      (total, item) => total + item.unitsInStock,
    );
      if (isAdmin) {
        final firstDay = DateTime(now.year, now.month, 1);
        final purchases = await _purchaseService.getPurchasesByDateRange(
          firstDay,
          now,
        );
        _purchaseThisMonth = purchases.length;
      }
    } on AppException catch (e) {
      _errorMessage = e.message;
      debugPrint('Dashboard: ${e.message}');
    } catch (e) {
      _errorMessage = 'No se pudo cargar el resumen';
      debugPrint('Dashboard error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
