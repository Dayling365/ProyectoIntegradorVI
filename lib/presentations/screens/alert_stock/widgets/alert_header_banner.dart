import 'package:flutter/material.dart';
import '../../../theme/app_text_theme.dart';

class AlertHeaderBanner extends StatelessWidget {
  const AlertHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Alertas de Bajo Stock', style: AppText.title),
        SizedBox(height: 4),
        Text('Monitoreo y control de artículos bajo umbral mínimo.',
            style: AppText.caption),
      ],
    );
  }
}
