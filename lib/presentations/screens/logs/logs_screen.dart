import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_libreria_app/presentations/providers/logs_provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/logs_filtros.dart';
import 'widgets/logs_lista.dart';
import 'widgets/logs_pagination.dart';
import '../../theme/app_text_theme.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  static const int _itemsPerPage = 10;

  int _currentPage = 1;
  String? _usuarioSeleccionado;
  String? _estadoSeleccionado;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LogsProvider>().fetchLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LogsProvider>();

    final usuarios = provider.logs
        .map((log) => log.userName ?? '')
        .where((usuario) => usuario.isNotEmpty)
        .toSet()
        .toList()
      ..sort();

    final filteredLogs = provider.filteredLogs.where((log) {
      final matchesUser = _usuarioSeleccionado == null ||
          log.userName == _usuarioSeleccionado;

      final matchesStatus = _estadoSeleccionado == null ||
          (log.status ?? '').toLowerCase() ==
              _estadoSeleccionado!.toLowerCase();

      return matchesUser && matchesStatus;
    }).toList();

    final totalPages = filteredLogs.isEmpty
        ? 1
        : (filteredLogs.length / _itemsPerPage).ceil();

    final safePage = _currentPage > totalPages ? totalPages : _currentPage;

    final pageItems = filteredLogs
        .skip((safePage - 1) * _itemsPerPage)
        .take(_itemsPerPage)
        .toList();

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
            const SizedBox(height: 16),

            LogsFiltros(
              usuarios: usuarios,
              usuarioSeleccionado: _usuarioSeleccionado,
              estadoSeleccionado: _estadoSeleccionado,
              fechaInicio: provider.startDate,
              fechaFin: provider.endDate,
              onUsuarioChanged: (usuario) {
                setState(() {
                  _usuarioSeleccionado = usuario;
                  _currentPage = 1;
                });
              },
              onEstadoChanged: (estado) {
                setState(() {
                  _estadoSeleccionado = estado;
                  _currentPage = 1;
                });
              },
              onFechaInicioChanged: (fecha) {
                provider.setDateRange(fecha, provider.endDate);
                setState(() {
                  _currentPage = 1;
                });
              },
              onFechaFinChanged: (fecha) {
                provider.setDateRange(provider.startDate, fecha);
                setState(() {
                  _currentPage = 1;
                });
              },
              onLimpiarFiltros: () {
                provider.resetFilters();
                setState(() {
                  _usuarioSeleccionado = null;
                  _estadoSeleccionado = null;
                  _currentPage = 1;
                });
              },
            ),

            const SizedBox(height: 16),

            Text('${filteredLogs.length} registros encontrados',
              style: AppText.bodySecondary),

            const SizedBox(height: 20),

            if (provider.isLoading && provider.logs.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (provider.errorMessage != null &&
                provider.logs.isEmpty)
              Text(
                provider.errorMessage!,
                style: AppText.bodySecondary,
              )
            else if (pageItems.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'No se encontraron logs.',
                    style: AppText.bodySecondary,
                  ),
                ),
              )
            else
              LogsLista(logs: pageItems),

            const SizedBox(height: 20),

            if (filteredLogs.isNotEmpty)
              LogsPagination(
                currentPage: safePage,
                totalPages: totalPages,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}