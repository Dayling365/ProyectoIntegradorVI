import 'package:flutter/material.dart';

enum UserRole { admin, vendedor }

class AppState extends ChangeNotifier {
  UserRole? role;
  String userName = '';

  bool get isAdmin => role == UserRole.admin;

  void login(String username) {
    final u = username.trim().toLowerCase();
    if (u == 'admin') {
      role = UserRole.admin;
      userName = 'Don César Admin';
    } else if (u == 'vendedor' || u == 'carlos') {
      role = UserRole.vendedor;
      userName = 'Carlos Martínez';
    }
    notifyListeners();
  }
}