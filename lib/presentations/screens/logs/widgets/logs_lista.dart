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

  bool _isSuccessful(String? status) {
    final cleanStatus = status?.toLowerCase().trim() ?? '';
    return cleanStatus == 'exitoso' ||
        cleanStatus == 'success' ||
        cleanStatus == 'successful';
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...logs.map((log) {
          final exitoso = _isSuccessful(log.status);
          final color = exitoso ? AppColors.success : AppColors.error;
          final etiqueta = log.entity?.trim().isNotEmpty == true
              ? log.entity!
              : log.requestType?.trim().isNotEmpty == true
                  ? log.requestType!
                  : log.status ?? 'Actividad';

          final titulo = log.userName?.trim().isNotEmpty == true
              ? log.userName!
              : (log.performedBy?.trim().isNotEmpty == true
                  ? log.performedBy!
                  : 'Sin usuario');

          return LogItem(
            icon: exitoso ? Icons.receipt_long_outlined : AppIcons.warning,
            iconColor: color,
            iconBg: color.withValues(alpha: 0.12),
            titulo: titulo,
            hora: _formatTime(log.timestamp),
            subtitulo: log.description ?? 'Sin descripción',
            etiqueta: etiqueta,
            etiquetaColor: color,
            etiquetaBg: color.withValues(alpha: 0.1),
          );
        }),
        const SizedBox(height: 10),
      ],
    );
  }
}