import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color primary = Color(0xFF1B2A5C);
    const Color info = Color(0xFF2563EB);
    const Color warning = Color(0xFFF59E0B);
    const Color success = Color(0xFF16A34A);
    const Color danger = Color(0xFFDC2626);
    return AppScaffold(
      currentRoute: AppRoutes.dashboard,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Hola, Administrador!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Aquí tienes un resumen de tu negocio hoy.',
              style: TextStyle(color: textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
