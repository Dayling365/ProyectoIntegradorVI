import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/services/purchase_service.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';

class DashboardProvider extends ChangeNotifier {
  final PurchaseService _purchaseService;

  DashboardProvider(this._purchaseService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int? _purchaseThisMonth;
  int? get purchaseThisMonth => _purchaseThisMonth;

  Future<void> load({required bool isAdmin}) async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      if (isAdmin) {
        final now = DateTime.now();
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
