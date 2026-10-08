import 'package:flutter/material.dart';


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
              style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF16233F),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFF16233F),
                      ),
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
                          backgroundColor: const Color(0xFFEDEDED),
                          valueColor: const AlwaysStoppedAnimation(Color(0xFF3B82F6)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(percentLabel, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
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