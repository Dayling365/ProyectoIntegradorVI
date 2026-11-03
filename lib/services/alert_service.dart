import 'package:sistema_libreria_app/data/models/alert_model.dart';
import 'package:sistema_libreria_app/data/models/paged_response_model.dart';
import 'package:sistema_libreria_app/data/models/product_model.dart';
import 'package:sistema_libreria_app/data/repositories/alert_repository.dart';
import 'package:sistema_libreria_app/data/repositories/product_repository.dart';

class AlertService {
  final AlertRepository _alertRepository;
  final ProductRepository _productRepository;

  AlertService(this._alertRepository, this._productRepository);

  static const int _productsPageSize = 100;

  /// Pide UNA página de alertas a la API y le agrega la categoría de cada producto.
  Future<PagedResponse<AlertModel>> getAlertsPage({
    required int pageNumber,
    required int pageSize,
  }) async {
    if (pageNumber < 1 || pageSize < 1) {
      throw ArgumentError('La página y el tamaño de página deben ser mayores a 0.');
    }

    final results = await Future.wait([
      _alertRepository.getPage(pageNumber: pageNumber, pageSize: pageSize),
      PagedResponse.fetchAll<ProductModel>(
        (page) => _productRepository.getPage(pageNumber: page, pageSize: _productsPageSize),
      ),
    ]);

    final alerts = results[0] as PagedResponse<AlertModel>;
    final products = results[1] as List<ProductModel>;
    final productsById = {for (final p in products) p.id: p};

    return PagedResponse(
      items: alerts.items.map((a) => a.withProduct(productsById[a.productId])).toList(),
      totalRecords: alerts.totalRecords,
      totalPages: alerts.totalPages,
      pageNumber: alerts.pageNumber,
      pageSize: alerts.pageSize,
    );
  }

  AlertSeverity severityOf(AlertModel alert) =>
      alert.unitsInStock <= 0 ? AlertSeverity.critical : AlertSeverity.warning;
}
