import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool isAlert;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.isAlert = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isAlert ? AppColors.errorBackground : AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isAlert
              ? AppColors.error.withValues(alpha: 0.3)
              : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),

            decoration: BoxDecoration(
              color: AppColors.accentLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            label,
            style: AppText.caption,
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: AppText.headingPrimary,
          ),

          const SizedBox(height: 6),


          const SizedBox(height: 6),

          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CustomPaint(
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}

