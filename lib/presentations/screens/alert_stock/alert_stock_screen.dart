import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/alert_provider.dart';
import '../../providers/view_status.dart';
import '../../theme/app_text_theme.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import 'widgets/alert_header_banner.dart';
import 'widgets/alert_stock_card.dart';
import 'widgets/alert_pagination.dart';

class AlertStockScreen extends StatefulWidget {
  const AlertStockScreen({super.key});

  @override
  State<AlertStockScreen> createState() => _AlertStockScreenState();
}

class _AlertStockScreenState extends State<AlertStockScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AlertProvider>().fetchAlerts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AlertProvider>();

    return AppScaffold(
      currentRoute: AppRoutes.alertStock,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AlertHeaderBanner(),
            const SizedBox(height: 20),
            _buildContent(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(AlertProvider provider) {
    switch (provider.viewStatus) {
      case ViewStatus.initial:
      case ViewStatus.loading:
        return const LoadingView(message: 'Cargando alertas...');

      case ViewStatus.error:
        return ErrorView(
          message: provider.errorMessage ?? 'No se pudieron cargar las alertas.',
          onRetry: provider.retry,
        );

      case ViewStatus.success:
        if (provider.alerts.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Text('No hay productos con stock bajo.', style: AppText.caption),
            ),
          );
        }
        return Column(
          children: [
            ...provider.alerts.map(
              (item) => AlertStockCard(item: item, severity: provider.severityOf(item)),
            ),
            const SizedBox(height: 8),
            AlertPagination(
              currentPage: provider.currentPage,
              totalPages: provider.totalPages,
              rangeStart: provider.rangeStart,
              rangeEnd: provider.rangeEnd,
              totalAlerts: provider.totalAlerts,
              onPageChanged: (page) => provider.fetchAlerts(page: page),
            ),
          ],
        );
    }
  }
}
