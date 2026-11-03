import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/logs_model.dart';

class LogsRepository {
  final ApiClient _apiClient;

  LogsRepository(this._apiClient);

  String get _endpoint {
    final base = ApiConstants.instance.baseUrl.trim();
    final path = ApiConstants.logs;
    if (base.endsWith('/api') && path.startsWith('/api')) {
      return path.substring(4);
    }
    if (!base.endsWith('/api') && !path.startsWith('/api')) {
      return '/api$path';
    }
    return path;
  }

  Future<List<LogModel>> _getAllPages(
    String path, {
    Map<String, String>? query,
  }) async {
    final logs = <LogModel>[];
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
          'La respuesta del servidor no es un listado válido de logs.',
        );
      }

      final pageLogs = data
          .whereType<Map<String, dynamic>>()
          .map((item) => LogModel.fromJson(item))
          .toList();

      logs.addAll(pageLogs);

      if (meta is Map<String, dynamic>) {
        final pages = meta['totalPages'] ?? meta['TotalPages'];
        if (pages != null) {
          totalPages = int.tryParse(pages.toString()) ?? pageNumber;
        } else if (pageLogs.length < pageSize) {
          break;
        } else {
          totalPages = pageNumber + 1;
        }
      } else if (pageLogs.length < pageSize) {
        break;
      } else {
        totalPages = pageNumber + 1;
      }

      pageNumber++;
    }

    return logs;
  }

  Future<List<LogModel>> getAll({Map<String, String>? query}) async {
    return _getAllPages(_endpoint, query: query);
  }

  Future<List<LogModel>> getLogs({Map<String, String>? params}) {
    return getAll(query: params);
  }

  Future<List<LogModel>> getLogsByDateRange(
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