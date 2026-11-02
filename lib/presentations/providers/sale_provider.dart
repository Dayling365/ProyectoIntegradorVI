import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/data/models/sale_model.dart';
import 'package:sistema_libreria_app/presentations/providers/purchase_provider.dart'
    show ViewStatus;
import 'package:sistema_libreria_app/services/sale_service.dart';

class SaleProvider extends ChangeNotifier {
  final SaleService _saleService;

  SaleProvider(this._saleService);

  List<SaleModel> sales = [];
  List<SaleModel> _filteredSales = [];
  int? _customerTypeId;
  String _searchQuery = '';
  DateTime? _startDate;
  DateTime? _endDate;
  String _sortOrder = 'newest';

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int? get customerTypeId => _customerTypeId;
  String get searchQuery => _searchQuery;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String get sortOrder => _sortOrder;

  List<SaleModel> get filteredSales => List.unmodifiable(_filteredSales);

  int get saleCount => _filteredSales.length;
  bool get hasSales => _filteredSales.isNotEmpty;
  bool get isLoading => _viewStatus == ViewStatus.loading;



  Map<int, String> get customerTypes {
    final types = <int, String> {};
    for (final sale in sales ){
      types[sale.costumerTypeId] = sale.costumerTypeName ?? 'Sin tipo';
    }
    return types;
  }

  Future<void> fetchSales() async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try{
      if (_startDate != null && _endDate != null){
        sales = await _saleService.getSalesByDateRange(
          _startDate!,
          _endDate!,
        );
      } else{
        sales = await _saleService.getAllSales();
      }

      _applyFilters();
      _viewStatus = ViewStatus.success;

    } catch (e){
      _errorMessage = 'No se pudieron cargar las ventas: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  void setCustomerType(int? id){
    _customerTypeId = id;
    _applyFilters();
    notifyListeners();
  }

  void searchSales(String query){
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  Future<void> setDateRange(DateTime? start, DateTime? end)async{
    _startDate = start;
    _endDate = end;
    await fetchSales();
  }

  void setSortOrder(String order){
    _sortOrder = order;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters(){
    final query = _searchQuery.trim().toLowerCase();

    _filteredSales = sales.where((sale) {
      final matchesType =
        _customerTypeId == null || sale.costumerTypeId == _customerTypeId;

      final matchesSearch = query.isEmpty ||
        (sale.costumerTypeName ?? '').toLowerCase().contains(query) ||
        sale.id.toString().contains(query);

      return matchesType && matchesSearch;
    }).toList();

    switch (_sortOrder){
      case 'oldest':
        _filteredSales.sort((a,b) => a.saleDate.compareTo(b.saleDate));
        break;
      case 'amountAsc':
        _filteredSales.sort((a,b) => a.totalAmount.compareTo(b.totalAmount));
        break;
      case 'amountDesc':
        _filteredSales.sort((a,b) => b.totalAmount.compareTo(a.totalAmount));
        break;
      case 'newest':
      default:
        _filteredSales.sort((a,b) => b.saleDate.compareTo(a.saleDate));

    }
  }

  Future<void> resetFilters() async {
    _customerTypeId = null;
    _searchQuery = '';
    _startDate = null;
    _endDate = null;
    _sortOrder = 'newest';
    await fetchSales();
  }

}