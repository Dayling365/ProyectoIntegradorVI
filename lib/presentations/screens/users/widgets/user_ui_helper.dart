import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../../data/models/user_model.dart';

class UserUiHelper {
  UserUiHelper._();

  static Color getRoleColor(UserModel user) {
    final role = user.primaryRole.toLowerCase();
    if (role.contains('admin')) {
      return AppColors.primary;
    }
    return AppColors.warning;
  }

  static Color getRoleBgColor(UserModel user) {
    final role = user.primaryRole.toLowerCase();
    if (role.contains('admin')) {
      return AppColors.primaryLight;
    }
    return AppColors.warningBackground;
  }

  static Color getStatusColor(UserModel user) {
    return user.isActive ? AppColors.success : (AppColors.textSecondary ?? Colors.grey);
  }

  static Color getStatusBgColor(UserModel user) {
    return user.isActive ? AppColors.successBackground : AppColors.surfaceMuted;
  }
}
