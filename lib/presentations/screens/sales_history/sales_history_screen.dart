import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_libreria_app/presentations/app_state.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'sales_data.dart';
import 'widgets_sales_history/sales_filters.dart';
import 'widgets_sales_history/sales_list.dart';
import 'widgets_sales_history/sales_pagination.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class SalesHistoryScreen extends StatefulWidget {
  const SalesHistoryScreen({super.key});

  @override
  State<SalesHistoryScreen> createState() => _SalesHistoryScreenState();
}

class _SalesHistoryScreenState extends State<SalesHistoryScreen> {
  static const int _perPage = 10;

  int _currentPage = 1;
  DateTime _from = DateTime(2026, 10, 1);
  DateTime _to = DateTime(2026, 10, 31);
  String _client = 'Todos';

  List<SaleRecord> _filtered(bool isAdmin, String userName) {
    final fromDay = DateTime(_from.year, _from.month, _from.day);
    final toDay = DateTime(_to.year, _to.month, _to.day, 23, 59, 59);

    return kSales.where((s) {
      if (!isAdmin && s.sellerName != userName) return false;
      if (_client != 'Todos' && s.clientName != _client) return false;
      if (s.date.isBefore(fromDay) || s.date.isAfter(toDay)) return false;
      return true;
    }).toList();
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? _from : _to,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked == null || !mounted) return;

    if (isFrom && picked.isAfter(_to)) {
      _showError('La fecha inicial no puede ser mayor que la final.');
      return;
    }
    if (!isFrom && picked.isBefore(_from)) {
      _showError('La fecha final no puede ser menor que la inicial.');
      return;
    }

    setState(() {
      if (isFrom) {
        _from = picked;
      } else {
        _to = picked;
      }
      _currentPage = 1;
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  void _clearFilters() {
    setState(() {
      _from = DateTime(2026, 10, 1);
      _to = DateTime(2026, 10, 31);
      _client = 'Todos';
      _currentPage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    final appState = context.watch<AppState>();
    final isAdmin = appState.isAdmin;

    final filtered = _filtered(isAdmin, appState.userName);
    final totalPages = filtered.isEmpty ? 1 : (filtered.length / _perPage).ceil();
    final page = _currentPage > totalPages ? totalPages : _currentPage;
    final pageItems = filtered.skip((page - 1) * _perPage).take(_perPage).toList();

    return AppScaffold(
      currentRoute: AppRoutes.salesHistory,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAdmin ? 'Historial de Ventas' : 'Mis Ventas Realizadas',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
            Text(
              isAdmin
                  ? 'Registro cronológico de facturas y ventas realizadas.'
                  : 'Registro de facturas y cobros emitidos por ti.',
              style: AppText.bodySecondary,
            ),
            const SizedBox(height: 16),

            SalesFilters(
              dateFrom: _from,
              dateTo: _to,
              onPickFrom: () => _pickDate(isFrom: true),
              onPickTo: () => _pickDate(isFrom: false),
              selectedClient: _client,
              onClientChanged: (c) => setState(() {
                _client = c;
                _currentPage = 1;
              }),
              onClear: _clearFilters,
            ),

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${filtered.length} ventas registradas',
                style: AppText.caption,
              ),
            ),

            const SizedBox(height: 12),

            if (filtered.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.search_off, size: 36, color: AppColors.textSecondary),
                    SizedBox(height: 8),
                    Text(
                      'No se encontraron ventas.',
                      textAlign: TextAlign.center,
                      style: AppText.bodySecondary,
                    ),
                  ],
                ),
              )
            else
              SalesList(sales: pageItems),

            const SizedBox(height: 16),

            if (filtered.isNotEmpty)
              SalesPagination(
                currentPage: page,
                totalPages: totalPages,
                onPageChanged: (p) => setState(() => _currentPage = p),
              ),
          ],
        ),
      ),
    );
  }
}