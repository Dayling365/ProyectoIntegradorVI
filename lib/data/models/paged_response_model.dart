import 'package:sistema_libreria_app/core/errors/app_exception.dart';

class PagedResponse<T> {
  final List<T> items;
  final int totalRecords;
  final int totalPages;
  final int pageNumber;
  final int pageSize;

  PagedResponse({
    required this.items,
    required this.totalRecords,
    required this.totalPages,
    required this.pageNumber,
    required this.pageSize,
  });

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonItem,
  ) {
    final data = json['data'] ?? json['Data'];
    final meta = json['meta'] ?? json['Meta'];

    // Cuando no hay registros la API responde 200 con { code, message, details } sin "data".
    if (data == null) {
      return PagedResponse.empty();
    }

    if (data is! List) {
      throw const ParsingException(
        'La respuesta del servidor no es un listado válido.',
      );
    }

    final items = data
        .whereType<Map<String, dynamic>>()
        .map(fromJsonItem)
        .toList();

    if (meta is! Map<String, dynamic>) {
      return PagedResponse.single(items);
    }

    return PagedResponse(
      items: items,
      totalRecords: _toInt(meta['totalRecords'] ?? meta['TotalRecords'], items.length),
      totalPages: _toInt(meta['totalPages'] ?? meta['TotalPages'], items.isEmpty ? 0 : 1),
      pageNumber: _toInt(meta['pageNumber'] ?? meta['PageNumber'], 1),
      pageSize: _toInt(meta['pageSize'] ?? meta['PageSize'], items.length),
    );
  }

  factory PagedResponse.single(List<T> items) {
    return PagedResponse(
      items: items,
      totalRecords: items.length,
      totalPages: items.isEmpty ? 0 : 1,
      pageNumber: 1,
      pageSize: items.length,
    );
  }

  factory PagedResponse.empty() => PagedResponse.single(<T>[]);

  bool get isEmpty => items.isEmpty;
  bool get hasNextPage => pageNumber < totalPages;

  /// Pide página por página hasta que no queden más, y junta todos los elementos.
  static Future<List<T>> fetchAll<T>(
    Future<PagedResponse<T>> Function(int pageNumber) fetchPage,
  ) async {
    final items = <T>[];
    var pageNumber = 1;

    while (true) {
      final page = await fetchPage(pageNumber);
      items.addAll(page.items);
      if (page.isEmpty || !page.hasNextPage) break;
      pageNumber++;
    }

    return items;
  }

  static int _toInt(dynamic value, int fallback) {
    if (value == null) return fallback;
    return int.tryParse(value.toString()) ?? fallback;
  }
}
