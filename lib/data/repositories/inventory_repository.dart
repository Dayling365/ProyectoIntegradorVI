import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/inventory_model.dart';
import 'package:sistema_libreria_app/data/models/paged_response_model.dart';

class InventoryRepository {
  final ApiClient _apiClient;

  InventoryRepository(this._apiClient);

  Future<PagedResponse<InventoryModel>> getPage({
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    final response = await _apiClient.get(
      ApiConstants.inventory,
      query: {
        'pageNumber': pageNumber.toString(),
        'pageSize': pageSize.toString(),
      },
    );

    if (response == null) {
      return PagedResponse.empty();
    }

    if (response is! Map<String, dynamic>) {
      throw const ParsingException(
        'La respuesta del servidor no es un listado válido de inventario.',
      );
    }

    return PagedResponse.fromJson(response, InventoryModel.fromJson);
  }
}
