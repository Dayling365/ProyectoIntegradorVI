import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/services/auth_service.dart';

enum AuthStatus{
  authenticated,
  unauthenticated,
  unknown,
}

class AuthProvider extends ChangeNotifier{
  final AuthService _authService;
  AuthProvider(this._authService);

  String? _errorMessage;
  AuthStatus _authStatus = AuthStatus.unknown;
  AuthStatus get authStatus => _authStatus;
  bool get isAuthenticated => _authStatus == AuthStatus.authenticated;
  bool _isSumitting = false;
  bool get isSubmitting => _isSumitting;

  Future<void> login({required String email, required String password}) async{
    if (_isSumitting) return;

    _isSumitting = true;
    notifyListeners();

    try{
      await _authService.login(email, password);
      _authStatus = AuthStatus.authenticated;

    } on AppException catch(e){
      _errorMessage = e.message;
    } catch(e){
      _errorMessage = 'An unexpected error ocurred. Please try again. ';

    }
     
    _isSumitting = false;
    notifyListeners();
    
  }

}