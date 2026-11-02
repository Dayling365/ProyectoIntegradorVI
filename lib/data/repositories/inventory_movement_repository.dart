import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/inventory_movement_model.dart';

class InventoryMovementRepository {
  final ApiClient _apiClient;

  InventoryMovementRepository(this._apiClient);

  String get _endpoint {
    final base = ApiConstants.instance.baseUrl.trim();
    final path = ApiConstants.inventoryMovements;
    if (base.endsWith('/api') && path.startsWith('/api')) {
      return path.substring(4);
    }
    if (!base.endsWith('/api') && !path.startsWith('/api')) {
      return '/api$path';
    }
    return path;
  }

  Future<List<InventoryMovementModel>> _getAllPages(
    String path, {
    Map<String, String>? query,
  }) async {
    final movements = <InventoryMovementModel>[];
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

      final pageMovements = data
          .whereType<Map<String, dynamic>>()
          .map((item) => InventoryMovementModel.fromJson(item))
          .toList();

      movements.addAll(pageMovements);

      if (meta is Map<String, dynamic>) {
        final pages = meta['totalPages'] ?? meta['TotalPages'];
        if (pages != null) {
          totalPages = int.tryParse(pages.toString()) ?? pageNumber;
        } else if (pageMovements.length < pageSize) {
          break;
        } else {
          totalPages = pageNumber + 1;
        }
      } else if (pageMovements.length < pageSize) {
        break;
      } else {
        totalPages = pageNumber + 1;
      }

      pageNumber++;
    }

    return movements;
  }

  Future<List<InventoryMovementModel>> getAll({
    Map<String, String>? query,
  }) async {
    return _getAllPages(_endpoint, query: query);
  }

  Future<InventoryMovementModel> getById(int id) async {
    final response = await _apiClient.get('$_endpoint/$id');

    if (response == null || response is! Map<String, dynamic>) {
      throw const ServerException(
        'El movimiento solicitado no existe.',
        statusCode: 404,
      );
    }

    final data = response['data'] ?? response['Data'] ?? response;

    if (data is! Map<String, dynamic>) {
      throw const ParsingException(
        'La respuesta del servidor no contiene un movimiento válido.',
      );
    }

    return InventoryMovementModel.fromJson(data);
  }

  Future<List<InventoryMovementModel>> getMovementsByDateRange(
    DateTime startDate,
    DateTime endDate, {
    Map<String, String>? query,
  }) async {
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
        ...?query,
        'startDate': startDate.toIso8601String(),
        'endDate': endOfDay.toIso8601String(),
      },
    );
  }

  Future<List<InventoryMovementModel>> getMovementsByProductId(
    int productId, {
    Map<String, String>? query,
  }) async {
    return _getAllPages(
      '$_endpoint/product/$productId',
      query: query,
    );
  }

  Future<List<InventoryMovementModel>> getMovementsByType(
    String movementType, {
    Map<String, String>? query,
  }) async {
    return _getAllPages(
      '$_endpoint/type/${Uri.encodeComponent(movementType)}',
      query: query,
    );
  }

  Future<List<InventoryMovementModel>> getMovements({Map<String, String>? params,}) =>getAll(query: params);
  Future<InventoryMovementModel> getMovementById(int id) {
    return getById(id);
  }
}