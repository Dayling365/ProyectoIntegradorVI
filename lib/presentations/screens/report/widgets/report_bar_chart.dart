import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';


class ReportBarChart extends StatelessWidget {
  final List<String> labels;
  final List<double> values;
  final int highlightedIndex;
  final double maxAxisValue;

  const ReportBarChart({
    super.key,
    required this.labels,
    required this.values,
    required this.maxAxisValue,
    this.highlightedIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    const double chartHeight = 150;
    final axisSteps = [
      maxAxisValue,
      maxAxisValue * 0.75,
      maxAxisValue * 0.5,
      maxAxisValue * 0.25,
      0.0,
    ];

    String formatAxis(double v) {
      if (v >= 1000) return 'C\$${(v / 1000).toStringAsFixed(0)}K';
      return 'C\$${v.toStringAsFixed(0)}';
    }

    String formatValue(double v) {
      if (v >= 1000) return 'C\$${(v / 1000).toStringAsFixed(1)}K';
      return 'C\$${v.toStringAsFixed(0)}';
    }

    return SizedBox(
      height: chartHeight + 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 38,
            height: chartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: axisSteps
                  .map((v) => Text(
                        formatAxis(v),
                        style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(values.length, (i) {
                final isHighlighted = i == highlightedIndex;
                final heightFactor = (values[i] / maxAxisValue).clamp(0.0, 1.0);
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: chartHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  formatValue(values[i]),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight:
                                        isHighlighted ? FontWeight.w700 : FontWeight.normal,
                                    color: isHighlighted
                                        ? AppColors.primary
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: (chartHeight - 20) * heightFactor,
                                decoration: BoxDecoration(
                                  color: isHighlighted
                                      ? AppColors.accent
                                      : AppColors.primary,
                                  borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(4)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            labels[i],
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight:
                                  isHighlighted ? FontWeight.w700 : FontWeight.normal,
                              color: isHighlighted
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}