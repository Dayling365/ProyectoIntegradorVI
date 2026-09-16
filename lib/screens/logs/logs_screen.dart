import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/logs_filtros.dart';
import 'widgets/logs_stats.dart';
import 'widgets/logs_lista.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return AppScaffold(
      currentRoute: AppRoutes.logs,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Logs del Sistema',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Auditoría y registro cronológico de eventos.',
              style: TextStyle(color: textSecondary, fontSize: 13),
            ),

            const LogsFiltros(),

            const SizedBox(height: 16),

            const LogsStats(),

            const SizedBox(height: 20),

            const LogsLista(),
          ],
        ),
      ),
    );
  }
}