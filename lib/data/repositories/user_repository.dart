import 'package:http/http.dart' as _apiclient;
import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<UserModel> getUserById(int userId) async {
    final json = await _apiClient.get('${ApiConstants.users}/$userId');
    if (json == null) throw const UnauthorizedException();
    if (json is! Map<String, dynamic>) throw ParsingException();

    return UserModel.fromJson(json);
  }

  Future<List<UserModel>> search(Map<String, String>? params) async {
    final data = await _apiClient.get(ApiConstants.users, query: params);
    if (data is! List) throw ParsingException();

    return data.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();

}
}