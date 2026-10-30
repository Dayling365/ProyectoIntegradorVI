import 'package:flutter/material.dart';
import '../../../../data/models/user_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import 'user_ui_helper.dart';

class UsersCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onMenuTap;
  final VoidCallback? onTap;

  const UsersCard({
    super.key,
    required this.user,
    this.onMenuTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final roleColor = UserUiHelper.getRoleColor(user);
    final roleBgColor = UserUiHelper.getRoleBgColor(user);
    final statusColor = UserUiHelper.getStatusColor(user);
    final statusBgColor = UserUiHelper.getStatusBgColor(user);

    return InkWell(
      onTap: onTap ?? onMenuTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.accentLight,
              child: Text(
                user.initials,
                style: AppText.captionPrimary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.subtitlePrimary,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    user.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.caption,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: roleBgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person, size: 12, color: roleColor),
                            const SizedBox(width: 4),
                            Text(
                              user.primaryRole,
                              style: TextStyle(
                                color: roleColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        user.statusLabel,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.more_vert, size: 18, color: AppColors.textSecondary),
                  onPressed: onMenuTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
