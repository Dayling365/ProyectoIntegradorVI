import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/sale_model.dart';

class SaleRepository {
  final ApiClient _apiClient;

  SaleRepository(this._apiClient);

  String get _endpoint {
    final base = ApiConstants.instance.baseUrl.trim();
    final path = ApiConstants.sales;

    if (base.endsWith('/api') && path.startsWith('/api')) {
      return path.substring(4);
    }
    if (!base.endsWith('/api') && !path.startsWith('/api')) {
      return '/api$path';
    }
    return path;
  }

  Future<List<SaleModel>> _getAllPages(
    String path, {
    Map<String, String>? query,
  }) async {

    final sales = <SaleModel>[];
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

      final pageSales = data
          .whereType<Map<String, dynamic>>()
          .map((item) => SaleModel.fromJson(item))
          .toList();

      sales.addAll(pageSales);

      if (meta is Map<String, dynamic>) {
        final pages = meta['totalPages'] ?? meta['TotalPages'];
        if (pages != null) {
          totalPages = int.tryParse(pages.toString()) ?? pageNumber;
        } else if (pageSales.length < pageSize) {
          break;
        } else {
          totalPages = pageNumber + 1;
        }
      } else if (pageSales.length < pageSize) {
        break;
      } else {
        totalPages = pageNumber + 1;
      }

      pageNumber++;
    }

    return sales;
  }

  Future<List<SaleModel>> getAll({Map<String, String>? query}) async {
    return _getAllPages(_endpoint, query: query);
  }

  Future<SaleModel> getById(int id) async {
    final response = await _apiClient.get('$_endpoint/$id');

    if (response == null || response is! Map<String, dynamic>) {
      throw const ServerException(
        'La venta solicitada no existe.',
        statusCode: 404,
      );
    }

    final data = response['data'] ?? response['Data'] ?? response;

    if (data is! Map<String, dynamic>) {
      throw const ParsingException(
        'La respuesta del servidor no contiene una venta válida.',
      );
    }

    return SaleModel.fromJson(data);
  }

  Future<List<SaleModel>> getSalesByDateRange(
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

}
