import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class LogItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String titulo;
  final String hora;
  final String fecha;
  final String subtitulo;
  final String etiqueta;
  final String tipoSolicitud;
  final String estado;
  final String metodo;
  final String ruta;
  final Color etiquetaColor;
  final Color etiquetaBg;

  const LogItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.titulo,
    required this.hora,
    required this.fecha,
    required this.subtitulo,
    required this.etiqueta,
    required this.tipoSolicitud,
    required this.estado,
    required this.metodo,
    required this.ruta,
    required this.etiquetaColor,
    required this.etiquetaBg,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: AppText.captionPrimary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitulo,
                      style: AppText.bodySecondary,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hora,
                    style: AppText.captionPrimary,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    fecha,
                    style: AppText.caption,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              _buildTag(etiqueta, etiquetaColor, etiquetaBg),
              _buildTag(
                tipoSolicitud,
                Colors.blue.shade700,
                Colors.blue.shade50,
              ),
              _buildTag(
                estado,
                etiquetaColor,
                etiquetaBg,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.code,
                      size: 15,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Método: $metodo',
                      style: AppText.captionPrimary,
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.link,
                      size: 15,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        ruta,
                        style: AppText.caption,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String texto, Color color, Color background) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
