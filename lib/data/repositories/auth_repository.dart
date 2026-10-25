import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/token_model.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<TokenModel> login(String username, String password) async{
    final json = await _apiClient.post(
      ApiConstants.login,
      body: {'username': username, 'password': password},
    );
    
    if (json is! Map<String, dynamic>) throw ParsingException();

    return TokenModel.fromJson(json);
  }
}
