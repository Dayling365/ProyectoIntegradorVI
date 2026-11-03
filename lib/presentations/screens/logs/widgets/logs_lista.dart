import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/logs_model.dart';
import 'logs_item.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_icons.dart';

class LogsLista extends StatelessWidget {
  final List<LogModel> logs;

  const LogsLista({
    super.key,
    required this.logs,
  });

  String _formatTime(DateTime? date) {
    if (date == null) return 'Sin hora';

    final localDate = date.toLocal();
    final hour = localDate.hour > 12
        ? localDate.hour - 12
        : localDate.hour == 0
            ? 12
            : localDate.hour;
    final suffix = localDate.hour >= 12 ? 'PM' : 'AM';
    final minute = localDate.minute.toString().padLeft(2, '0');

    return '$hour:$minute $suffix';
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Sin fecha';

    final localDate = date.toLocal();

    final day = localDate.day.toString().padLeft(2, '0');
    final month = localDate.month.toString().padLeft(2, '0');
    final year = localDate.year;

    return '$day/$month/$year';
  }

  bool _isSuccessful(String? status) {
    final cleanStatus = status?.toLowerCase().trim() ?? '';
    return cleanStatus == 'exitoso' ||
        cleanStatus == 'success' ||
        cleanStatus == 'successful';
  }

  bool _isError(String? status) {
    final cleanStatus = status?.toLowerCase().trim() ?? '';

    return cleanStatus == 'error' ||
        cleanStatus == 'fallido' ||
        cleanStatus == 'failed';
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...logs.map((log) {
          final exitoso = _isSuccessful(log.status);
          final error = _isError(log.status);

          final color = exitoso
              ? AppColors.success
              : error
                  ? AppColors.error
                  : Colors.blueGrey;

          final etiqueta = log.entity?.trim().isNotEmpty == true
              ? log.entity!
              : 'Sin entidad';

          final titulo = log.displayUser;

          return LogItem(
            icon: exitoso ? Icons.receipt_long_outlined : error ? AppIcons.warning
            : Icons.info_outline,
            iconColor: color,
            iconBg: color.withValues(alpha: 0.12),
            titulo: titulo,
            hora: _formatTime(log.timestamp),
            fecha: _formatDate(log.timestamp),
            subtitulo: log.description?.trim().isNotEmpty == true
                ? log.description!
                : 'Sin descripción',
            etiqueta: etiqueta,
            tipoSolicitud: log.requestType?.trim().isNotEmpty == true
                ? log.requestType!
                : 'Sin tipo',
            estado: log.status?.trim().isNotEmpty == true
                ? log.status!
                : 'Sin estado',
            metodo: log.method?.trim().isNotEmpty == true
                ? log.method!
                : 'No especificado',
            ruta: log.path?.trim().isNotEmpty == true
                ? log.path!
                : 'Sin ruta',
            etiquetaColor: color,
            etiquetaBg: color.withValues(alpha: 0.1),
          );
        }),
        const SizedBox(height: 10),
      ],
    );
  }
}