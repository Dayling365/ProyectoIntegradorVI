import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/data/models/logs_model.dart';
import 'package:sistema_libreria_app/services/logs_service.dart';

enum ViewStatus { initial, loading, success, error }

class LogsProvider extends ChangeNotifier {
  final LogsService _logsService;

  LogsProvider(this._logsService);

  List<LogModel> logs = [];

  List<LogModel> _filteredLogs = [];
  String? _userName;
  String? _status;
  DateTime? _startDate;
  DateTime? _endDate;

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? get userName => _userName;
  String? get status => _status;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  List<LogModel> get filteredLogs => List.unmodifiable(_filteredLogs);

  int get logCount => _filteredLogs.length;
  bool get hasLogs => _filteredLogs.isNotEmpty;
  bool get isLoading => _viewStatus == ViewStatus.loading;

  Future<void> fetchLogs() async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      if (_startDate != null && _endDate != null) {
        logs = await _logsService.getLogsByDateRange(
          _startDate!,
          _endDate!,
        );
      } else {
        logs = await _logsService.getAllLogs();
      }

      _applyFilters();
      _viewStatus = ViewStatus.success;
    } catch (e) {
      _errorMessage = 'No se pudieron cargar los logs: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  void setUser(String? userName) {
    _userName = userName == 'Todos' ? null : userName;
    _applyFilters();
    notifyListeners();
  }

  void setStatus(String? status) {
    _status = status == 'Todos' ? null : status;
    _applyFilters();
    notifyListeners();
  }

  Future<void> setDateRange(DateTime? start, DateTime? end) async {
    _startDate = start;
    _endDate = end;
    await fetchLogs();
  }

  void _applyFilters() {
    _filteredLogs = logs.where((log) {
      final matchesUser =
    _userName == null || log.displayUser == _userName;

      final matchesStatus = _status == null ||
          (log.status ?? '').toLowerCase() == _status!.toLowerCase();

      return matchesUser && matchesStatus;
    }).toList();
  }

  Future<void> resetFilters() async {
    _userName = null;
    _status = null;
    _startDate = null;
    _endDate = null;
    await fetchLogs();
  }
}