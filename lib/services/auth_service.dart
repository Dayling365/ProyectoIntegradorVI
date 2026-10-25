import 'package:sistema_libreria_app/core/constant/regular_expressions.dart';
import 'package:sistema_libreria_app/data/models/token_model.dart';
//import 'package:sistema_libreria_app/data/models/token_model.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';
import 'package:sistema_libreria_app/data/repositories/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository;
  //final TokenService _tokenService;

  //AuthService(this._authRepository, this._tokenService);
  AuthService(this._authRepository);

  Future<void> login(String username, String password) async {
    final trimmedUsername = username.trim();
    final trimmedPassword = password.trim();

    if(trimmedUsername.isEmpty || trimmedPassword.isEmpty) {
      throw ArgumentError('Username and password cannot be empty.');
    }

    if(!CommonRegex.usernameRegex.hasMatch(trimmedUsername)) {
      throw const FormatException('Invalid username format.');
    }

    if(!CommonRegex.passwordRegex.hasMatch(trimmedPassword)) {
      throw const FormatException('Invalid password format.');
    }

     final TokenModel token =await _authRepository.login(username, password);
  }

  Future<UserModel> getCurrentUser() async {
    return await _authRepository.currentUser();
  } 

}