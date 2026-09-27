import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/alert_stock_item.dart';
import 'widgets/alert_header_banner.dart';
import 'widgets/alert_stock_card.dart';
import 'widgets/alert_pagination.dart';

class AlertStockScreen extends StatefulWidget {
  const AlertStockScreen({super.key});

  @override
  State<AlertStockScreen> createState() => _AlertStockScreenState();
}

class _AlertStockScreenState extends State<AlertStockScreen> {
  int _currentPage = 1;
  final int _totalPages = 5;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.alertStock,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlertHeaderBanner(activeAlertsCount: totalActiveAlerts),
            const SizedBox(height: 20),
            ...demoAlerts.map((item) => AlertStockCard(item: item)),
            const SizedBox(height: 8),
            AlertPagination(
              currentPage: _currentPage,
              totalPages: _totalPages,
              rangeStart: 1,
              rangeEnd: demoAlerts.length,
              totalAlerts: totalActiveAlerts,
              onPageChanged: (p) => setState(() => _currentPage = p),
            ),
          ],
        ),
      ),
    );
  }
}