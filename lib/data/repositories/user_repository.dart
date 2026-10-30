import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  String get _endpoint {
    final base = ApiConstants.instance.baseUrl.trim();
    final path = ApiConstants.users;
    if (base.endsWith('/api') && path.startsWith('/api')) {
      return path.substring(4);
    }
    if (!base.endsWith('/api') && !path.startsWith('/api')) {
      return '/api$path';
    }
    return path;
  }

  Future<List<UserModel>> getAll({Map<String, String>? query}) async {
    final response = await _apiClient.get(_endpoint, query: query);

    if (response == null) {
      return <UserModel>[];
    }

    if (response is List) {
      return response
          .whereType<Map<String, dynamic>>()
          .map((item) => UserModel.fromJson(item))
          .toList();
    }

    if (response is Map<String, dynamic>) {
      final data = response['data'] ?? response['Data'];
      if (data is List) {
        return data
            .whereType<Map<String, dynamic>>()
            .map((item) => UserModel.fromJson(item))
            .toList();
      }
    }

    throw const ParsingException('La respuesta del servidor no es un listado válido.');
  }

  Future<UserModel> getById(int id) async {
    final response = await _apiClient.get('$_endpoint/$id');
    if (response == null || response is! Map<String, dynamic>) {
      throw const ServerException('El usuario solicitado no existe.', statusCode: 404);
    }
    return UserModel.fromJson(response);
  }

  Future<List<UserModel>> getUsers({Map<String, String>? params}) => getAll(query: params);
  Future<UserModel> getUserById(int id) => getById(id);
}
