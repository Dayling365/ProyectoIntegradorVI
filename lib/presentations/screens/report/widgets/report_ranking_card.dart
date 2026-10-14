import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';


class ReportRankingCard extends StatelessWidget {
  final int rank;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String productName;
  final String value;
  final String percentLabel;
  final double progress;

  const ReportRankingCard({
    super.key,
    required this.rank,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.productName,
    required this.value,
    required this.percentLabel,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Text(
              '$rank',
              style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.bodyStrong,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      value,
                      style: AppText.bodyStrong,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 6,
                          backgroundColor: AppColors.borderLight,
                          valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(percentLabel, style: AppText.micro),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}