import 'package:flutter/material.dart';

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
            color: const Color(0xFFDC2626).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.warning_amber_rounded, color: Color(0xFFDC2626), size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Alertas de Bajo Stock',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36))),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFFDC2626), borderRadius: BorderRadius.circular(20)),
                    child: const Text('CRÍTICO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text('Monitoreo y control de artículos bajo umbral mínimo.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: Color(0xFFDC2626), shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Text('$activeAlertsCount productos requieren atención inmediata',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFDC2626))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}