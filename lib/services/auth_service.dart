import 'package:sistema_libreria_app/core/constant/regular_expressions.dart';
import 'package:sistema_libreria_app/data/models/token_model.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';
import 'package:sistema_libreria_app/data/repositories/auth_repository.dart';
import 'package:sistema_libreria_app/data/repositories/token_repository.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';

class AuthService {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  AuthService(this._authRepository,this._tokenRepository);

  Future<void> login(String username, String password) async {
    final trimmedUsername = username.trim();
    final trimmedPassword = password.trim();

    if(trimmedUsername.isEmpty || trimmedPassword.isEmpty) {
      throw ArgumentError('Username and password cannot be empty.');
    }

    if(!CommonRegex.usernameRegex.hasMatch(trimmedUsername)) {
      throw const FormatException('Invalid username format.');
    }

    

    try {
      final TokenModel token = await _authRepository.login(trimmedUsername, password);
      await _tokenRepository.saveToken(token);
    } on UnauthorizedException {
      throw const UnauthorizedException('Usuario o contraseña incorrectos.');
    }
  }

  Future<UserModel> getCurrentUser() async {
    return await _authRepository.currentUser();
  } 
  Future<void> logout() async {
    await _tokenRepository.removeToken();
  }
  

}