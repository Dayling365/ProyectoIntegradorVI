import 'package:flutter/material.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/logs_filtros.dart';
import 'widgets/logs_stats.dart';
import 'widgets/logs_lista.dart';
import 'widgets/logs_pagination.dart';
import '../../theme/app_text_theme.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  int _currentPage = 1;
  final int _totalPages = 5;

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      currentRoute: AppRoutes.logs,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Logs del Sistema',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
            const Text(
              'Auditoría y registro cronológico de eventos.',
              style: AppText.bodySecondary,
            ),

            const LogsFiltros(),

            const SizedBox(height: 16),

            const LogsStats(),

            const SizedBox(height: 20),

            const LogsLista(),

            const SizedBox(height: 20),

            LogsPagination(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: (p) => setState(() => _currentPage = p),
            ),
          ],
        ),
      ),
    );
  }
}