import 'package:flutter/material.dart';
import 'logs_item.dart';

class LogsLista extends StatelessWidget {
  const LogsLista({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textSecondary = Color(0xFF8A94A6);
    const Color info = Color(0xFF2563EB);
    const Color warning = Color(0xFFF59E0B);
    const Color alert = Color(0xFFDC2626);
    const Color success = Color(0xFF16A34A);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Hoy, 16 septiembre',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textSecondary,
            ),
          ),
        ),

        LogItem(
          icon: Icons.login,
          iconColor: info,
          iconBg: info.withOpacity(0.12),
          titulo: 'Don César Admin',
          hora: '10:45 AM',
          subtitulo: 'Inicio de sesión exitoso',
          etiqueta: 'Seguridad',
          etiquetaColor: info,
          etiquetaBg: info.withOpacity(0.1),
        ),

        LogItem(
          icon: Icons.warning_amber_rounded,
          iconColor: alert,
          iconBg: alert.withOpacity(0.12),
          titulo: 'Ana García',
          hora: '09:12 AM',
          subtitulo: 'Producto desactivado: El Quijote (Ed. Especial)',
          etiqueta: 'Inventario',
          etiquetaColor: alert,
          etiquetaBg: alert.withOpacity(0.1),
        ),

        LogItem(
          icon: Icons.edit,
          iconColor: warning,
          iconBg: warning.withOpacity(0.12),
          titulo: 'Don César Admin',
          hora: '08:30 AM',
          subtitulo: 'Cambio de estado: Miguel Vargas',
          etiqueta: 'Usuarios',
          etiquetaColor: success,
          etiquetaBg: success.withOpacity(0.1),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Ayer, 15 septiembre',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textSecondary,
            ),
          ),
        ),

        LogItem(
          icon: Icons.login,
          iconColor: info,
          iconBg: info.withOpacity(0.12),
          titulo: 'Don César Admin',
          hora: '10:45 AM',
          subtitulo: 'Inicio de sesión exitoso',
          etiqueta: 'Seguridad',
          etiquetaColor: info,
          etiquetaBg: info.withOpacity(0.1),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.refresh, size: 18, color: info),
            label: const Text(
              'Cargar más eventos',
              style: TextStyle(color: info, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}