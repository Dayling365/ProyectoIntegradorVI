import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/data/models/alert_model.dart';
import 'package:sistema_libreria_app/data/models/paged_response_model.dart';
import 'package:sistema_libreria_app/presentations/providers/view_status.dart';
import 'package:sistema_libreria_app/services/alert_service.dart';

class AlertProvider extends ChangeNotifier {
  final AlertService _alertService;

  AlertProvider(this._alertService);

  static const int pageSize = 10;

  PagedResponse<AlertModel> _page = PagedResponse.empty();

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _requestedPage = 1;

  List<AlertModel> get alerts => List.unmodifiable(_page.items);
  int get currentPage => _page.pageNumber;
  int get totalPages => _page.totalPages;
  int get totalAlerts => _page.totalRecords;
  int get rangeStart => _page.isEmpty ? 0 : (_page.pageNumber - 1) * _page.pageSize + 1;
  int get rangeEnd => _page.isEmpty ? 0 : rangeStart + _page.items.length - 1;

  AlertSeverity severityOf(AlertModel alert) => _alertService.severityOf(alert);

  Future<void> fetchAlerts({int page = 1}) async {
    _requestedPage = page;
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _page = await _alertService.getAlertsPage(pageNumber: page, pageSize: pageSize);
      _viewStatus = ViewStatus.success;
    } on AppException catch (e) {
      _errorMessage = e.message;
      _viewStatus = ViewStatus.error;
    } catch (e) {
      _errorMessage = 'No se pudieron cargar las alertas: $e';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> retry() => fetchAlerts(page: _requestedPage);
}
