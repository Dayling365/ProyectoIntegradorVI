import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/services/auth_service.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';

enum AuthStatus{
  authenticated,
  unauthenticated,
  unknown,
}

class AuthProvider extends ChangeNotifier{
  final AuthService _authService;
  AuthProvider(this._authService);
  int requestCount = 0;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  UserModel? _user;
  UserModel? get user => _user;
  AuthStatus _authStatus = AuthStatus.unknown;
  AuthStatus get authStatus => _authStatus;
  bool get isAuthenticated => _authStatus == AuthStatus.authenticated;
  bool _isSumitting = false;
  bool get isSubmitting => _isSumitting;

  Future<bool> login({required String username, required String password}) async{
    if (_isSumitting) return false;

    _isSumitting = true;
    _errorMessage = null;
    notifyListeners();

    var success = false;

    try{
      await _authService.login(username, password);
      _user = await _authService.getCurrentUser();
      _authStatus = AuthStatus.authenticated;
      success = true;

    } on AppException catch(e){
      _authStatus = AuthStatus.unauthenticated;
      _errorMessage = e.message;
    } on FormatException{
      _authStatus = AuthStatus.unauthenticated;
      _errorMessage = 'The user can use only letters, numbers and guion bajo(5-20 characteres)';
    } catch(e){
      _authStatus = AuthStatus.unauthenticated;
      _errorMessage = 'An unexpected error ocurred. Please try again. ';
      debugPrint('Login error: $e');
    }
     
    _isSumitting = false;
    notifyListeners();
    return success;
    
  }

  Future<void> logout() async{
    await _authService.logout();
    _user = null;
    _authStatus = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

}