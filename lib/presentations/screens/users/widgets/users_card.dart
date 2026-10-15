import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class UsersCard extends StatelessWidget {
  final String initials;
  final String name;
  final String email;
  final String roleLabel;
  final Color roleColor;
  final Color roleBgColor;
  final String statusLabel;
  final Color statusColor;
  final Color statusBgColor;
  final VoidCallback? onMenuTap;

  const UsersCard({
    super.key,
    required this.initials,
    required this.name,
    required this.email,
    required this.roleLabel,
    required this.roleColor,
    required this.roleBgColor,
    required this.statusLabel,
    required this.statusColor,
    required this.statusBgColor,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              initials,
              style: AppText.captionPrimary,
            ),
          ),
          const SizedBox(width: 10),

          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.subtitlePrimary,
                ),
                const SizedBox(height: 2),
                Text(
                  email,
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
                            roleLabel,
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
                      statusLabel,
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
    );
  }
}

