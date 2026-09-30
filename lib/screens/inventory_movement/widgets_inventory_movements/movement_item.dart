import 'package:flutter/material.dart';
import '../../../app_routes.dart';
import '../../models_movement/movement.dart';

class MovementItem extends StatelessWidget {
  final Movement movement;

  const MovementItem({
    super.key,
    required this.movement,
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
                      movement.productName,
                      style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      movement.category,
                      style: const TextStyle(fontSize: 12, color: textSecondary),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: movement.movementBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  movement.movementLabel,
                  style: TextStyle(
                    fontSize: 11,
                    color: movement.movementColor,
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
              Text(
                movement.fechaHora,
                style: const TextStyle(fontSize: 11, color: textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 10),
          if (movement.esAlerta)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: 'Stock: '),
                      TextSpan(text: '${movement.stockPrevio}'),
                      const TextSpan(text: ' → '),
                      TextSpan(text: '${movement.stockFinal}'),
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
                const SizedBox(height: 8),
                Row(
                  children: [
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
                            movement.motivo,
                            style: const TextStyle(
                              fontSize: 11,
                              color: warning,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.inventoryMovementDetails,
                        arguments: movement,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ver detalle',
                            style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600,
                              color: info,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_forward, size: 12, color: info),
                        ],
                      ),
                    ),
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
                        TextSpan(text: '${movement.stockPrevio}'),
                        const TextSpan(text: ' → '),
                        TextSpan(text: '${movement.stockFinal}'),
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(movement.movementIcon, size: 14, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      movement.motivo,
                      style: const TextStyle(fontSize: 12, color: textSecondary),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.inventoryMovementDetails,
                    arguments: movement,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ver detalle',
                        style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600,
                          color: info,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.arrow_forward, size: 12, color: info),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}