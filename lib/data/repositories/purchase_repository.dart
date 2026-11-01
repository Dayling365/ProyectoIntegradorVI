import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/purchase_model.dart';

class PurchaseRepository {
  final ApiClient _apiClient;

  PurchaseRepository(this._apiClient);

  String get _endpoint {
    final base = ApiConstants.instance.baseUrl.trim();
    final path = ApiConstants.purchases;
    if (base.endsWith('/api') && path.startsWith('/api')) {
      return path.substring(4);
    }
    if (!base.endsWith('/api') && !path.startsWith('/api')) {
      return '/api$path';
    }
    return path;
  }

  Future<List<PurchaseModel>> _getAllPages(
    String path, {
    Map<String, String>? query,
  }) async {
    final purchases = <PurchaseModel>[];
    const pageSize = 100;
    var pageNumber = 1;
    var totalPages = 1;

    while (pageNumber <= totalPages) {
      final pageQuery = <String, String>{
        ...?query,
        'pageNumber': pageNumber.toString(),
        'pageSize': pageSize.toString(),
      };

      final response = await _apiClient.get(path, query: pageQuery);

      if (response == null) {
        break;
      }

      dynamic data = response;
      dynamic meta;

      if (response is Map<String, dynamic>) {
        data = response['data'] ?? response['Data'];
        meta = response['meta'] ?? response['Meta'];
      }

      if (data == null) {
        break;
      }

      if (data is! List) {
        throw const ParsingException(
          'La respuesta del servidor no es un listado válido.',
        );
      }

      final pagePurchases = data
          .whereType<Map<String, dynamic>>()
          .map((item) => PurchaseModel.fromJson(item))
          .toList();

      purchases.addAll(pagePurchases);

      if (meta is Map<String, dynamic>) {
        final pages = meta['totalPages'] ?? meta['TotalPages'];
        if (pages != null) {
          totalPages = int.tryParse(pages.toString()) ?? pageNumber;
        } else if (pagePurchases.length < pageSize) {
          break;
        } else {
          totalPages = pageNumber + 1;
        }
      } else if (pagePurchases.length < pageSize) {
        break;
      } else {
        totalPages = pageNumber + 1;
      }

      pageNumber++;
    }

    return purchases;
  }

  Future<List<PurchaseModel>> getAll({Map<String, String>? query}) async {
    return _getAllPages(_endpoint, query: query);
  }

  Future<PurchaseModel> getById(int id) async {
    final response = await _apiClient.get('$_endpoint/$id');

    if (response == null || response is! Map<String, dynamic>) {
      throw const ServerException(
        'La compra solicitada no existe.',
        statusCode: 404,
      );
    }

    final data = response['data'] ?? response['Data'] ?? response;

    if (data is! Map<String, dynamic>) {
      throw const ParsingException(
        'La respuesta del servidor no contiene una compra válida.',
      );
    }

    return PurchaseModel.fromJson(data);
  }

  Future<List<PurchaseModel>> getPurchasesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final endOfDay = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
    );

    return _getAllPages(
      '$_endpoint/bydaterange',
      query: {
        'startDate': startDate.toIso8601String(),
        'endDate': endOfDay.toIso8601String(),
      },
    );
  }

  Future<List<PurchaseModel>> getPurchases({Map<String, String>? params}) => getAll(query: params);
  Future<PurchaseModel> getPurchaseById(int id) => getById(id);
  Future<PurchaseModel> getPurchaseDetailsById(int id) async {
    return getById(id);
  }
}
