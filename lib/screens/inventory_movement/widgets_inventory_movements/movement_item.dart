import 'package:flutter/material.dart';

class MovementItem extends StatelessWidget {
  final String producto;
  final String categoria;
  final String fecha;
  final String stockAntes;
  final String stockDespues;
  final String motivo;
  final IconData motivoIcon;
  final String etiqueta;
  final Color etiquetaColor;
  final Color etiquetaBg;
  final bool esAlerta;

  const MovementItem({
    super.key,
    required this.producto,
    required this.categoria,
    required this.fecha,
    required this.stockAntes,
    required this.stockDespues,
    required this.motivo,
    required this.motivoIcon,
    required this.etiqueta,
    required this.etiquetaColor,
    required this.etiquetaBg,
    this.esAlerta = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color info = Color(0xFF2563EB);
    const Color warning = Color(0xFFF59E0B);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto,
                      style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      categoria,
                      style: const TextStyle(fontSize: 12, color: textSecondary),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.access_time, size: 12, color: textSecondary),
              const SizedBox(width: 4),
              Text( fecha,
                style: const TextStyle(fontSize: 11, color: textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 10),
          if (esAlerta)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 13,
                        color: textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(text: 'Stock: '),
                        TextSpan(text: stockAntes),
                        const TextSpan(text: ' → '),
                        TextSpan(text: stockDespues),
                        const TextSpan(
                          text: ' unid.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: warning.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.circle, size: 6, color: warning),
                      const SizedBox(width: 4),
                      Text(
                        motivo,
                        style: const TextStyle(
                          fontSize: 11,
                          color: warning,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text( 'Ver detalle',
                      style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600,
                        color: info,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, size: 12, color: info),
                  ],
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 13,
                        color: textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(text: 'Stock: '),
                        TextSpan(text: stockAntes),
                        const TextSpan(text: ' → '),
                        TextSpan(text: stockDespues),
                        const TextSpan( text: ' unid.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(motivoIcon, size: 14, color: textSecondary),
                    const SizedBox(width: 4),
                    Text( motivo,
                      style: const TextStyle(fontSize: 12, color: textSecondary),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text( 'Ver detalle',
                      style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600,
                        color: info,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, size: 12, color: info),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}