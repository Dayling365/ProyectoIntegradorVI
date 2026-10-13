import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart'; 
import '../../../theme/app_text_theme.dart';

class LogItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String titulo;
  final String hora;
  final String subtitulo;
  final String etiqueta;
  final Color etiquetaColor;
  final Color etiquetaBg;

  const LogItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.titulo,
    required this.hora,
    required this.subtitulo,
    required this.etiqueta,
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
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        titulo,
                        style: AppText.captionPrimary,
                      ),
                    ),
                    Text(
                      hora,
                      style: AppText.caption,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  subtitulo,
                  style: AppText.bodySecondary,
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: etiquetaBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    etiqueta,
                    style: TextStyle(
                      fontSize: 11,
                      color: etiquetaColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}