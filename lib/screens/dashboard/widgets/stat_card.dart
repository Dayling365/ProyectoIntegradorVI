import 'package:flutter/material.dart';

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
    const Color danger = Color(0xFFDC2626);
    const Color success = Color(0xFF16A34A);
    const Color dangerSoft = Color(0xFFFEE2E2);
    const Color card = Colors.white;
    const Color border = Color(0xFFE5E7EB);
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    final Color trendColor = isAlert ? danger : success;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isAlert ? dangerSoft : card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isAlert
              ? danger.withValues(alpha: 0.3)
              : border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),

            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
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
            style: const TextStyle(
              color: textSecondary,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: const TextStyle(
              color: textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

         /* Row(
            children: [
              Icon(
                isAlert
                    ? Icons.trending_down
                    : Icons.trending_up,
                size: 14,
                color: trendColor,
              ),

              const SizedBox(width: 4),

              Text(
                trend,
                style: TextStyle(
                  color: trendColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),*/

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

