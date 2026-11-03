import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/supplier_model.dart';

class SupplierRepository {
  final ApiClient _apiClient;

  SupplierRepository(this._apiClient);

  Future<List<SupplierModel>> getAll() async {
    final suppliers = <SupplierModel>[];
    const pageSize = 100;
    var pageNumber = 1;
    var totalPages = 1;

    while (pageNumber <= totalPages) {
      final response = await _apiClient.get(
        ApiConstants.suppliers,
        query: {
          'pageNumber': pageNumber.toString(),
          'pageSize': pageSize.toString(),
        },
      );

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
          'La respuesta del servidor no es un listado válido de proveedores.',
        );
      }

      final pageSuppliers = data
          .whereType<Map<String, dynamic>>()
          .map(SupplierModel.fromJson)
          .toList();

      suppliers.addAll(pageSuppliers);

      if (meta is Map<String, dynamic>) {
        final pages = meta['totalPages'] ?? meta['TotalPages'];
        if (pages != null) {
          totalPages = int.tryParse(pages.toString()) ?? pageNumber;
        } else if (pageSuppliers.length < pageSize) {
          break;
        } else {
          totalPages = pageNumber + 1;
        }
      } else if (pageSuppliers.length < pageSize) {
        break;
      } else {
        totalPages = pageNumber + 1;
      }

      pageNumber++;
    }

    return suppliers;
  }
}