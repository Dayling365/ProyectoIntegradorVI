import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistema_libreria_app/data/models/token_model.dart';

class TokenRepository {
  
  final SharedPreferencesAsync _sharedPreferences =  SharedPreferencesAsync();
  final String _tokenKey = 'auth_token';

  Future<void> saveToken(TokenModel token)async{
    final String jsonString = jsonEncode(token.toJson());
    await _sharedPreferences.setString(_tokenKey, jsonString);
  }
 
  Future <TokenModel?> getToken() async {
    final String? rawJson = await _sharedPreferences.getString(_tokenKey);
    if (rawJson == null) return null;

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(rawJson);
      final token = TokenModel.fromJson(jsonMap);
      if (token.isAccesTokenExpired) {
        await removeToken();
        return null;
      }
      return token;
     
    }catch (e) {
      await removeToken();
    }
  }
  Future<void> removeToken() async{
    await _sharedPreferences.remove(_tokenKey);
  }
}