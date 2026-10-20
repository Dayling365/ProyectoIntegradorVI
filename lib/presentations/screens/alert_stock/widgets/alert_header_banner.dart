import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class AlertHeaderBanner extends StatelessWidget {
  final int activeAlertsCount;

  const AlertHeaderBanner({super.key, required this.activeAlertsCount});

  @override
 Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.error.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Alertas de Bajo Stock',
                      style: AppText.title),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(20)),
                    child: const Text('CRÍTICO', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text('Monitoreo y control de artículos bajo umbral mínimo.',
                  style: AppText.caption),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Text('$activeAlertsCount productos requieren atención inmediata',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.error)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}