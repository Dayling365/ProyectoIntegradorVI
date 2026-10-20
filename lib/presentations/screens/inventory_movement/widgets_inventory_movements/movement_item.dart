import 'package:flutter/material.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import '../../models_movement/movement.dart';

class MovementItem extends StatelessWidget {
  final Movement movement;

  const MovementItem({
    super.key,
    required this.movement,
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
                      style: AppText.subtitle,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      movement.category,
                      style: AppText.caption,
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
              const Icon(Icons.access_time, size: 12, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(
                movement.fechaHora,
                style: AppText.micro,
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
                    style: AppText.bodyStrong,
                    children: [
                      const TextSpan(text: 'Stock: '),
                      TextSpan(text: '${movement.stockPrevio}'),
                      const TextSpan(text: ' → '),
                      TextSpan(text: '${movement.stockFinal}'),
                      const TextSpan(
                        text: ' unid.',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.textSecondary,
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
                        color: AppColors.warning.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.circle, size: 6, color: AppColors.warning),
                          const SizedBox(width: 4),
                          Text(
                            movement.motivo,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.warning,
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
                            style: AppText.captionInfo,
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_forward, size: 12, color: AppColors.accent),
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
                      style: AppText.bodyStrong,
                      children: [
                        const TextSpan(text: 'Stock: '),
                        TextSpan(text: '${movement.stockPrevio}'),
                        const TextSpan(text: ' → '),
                        TextSpan(text: '${movement.stockFinal}'),
                        const TextSpan(
                          text: ' unid.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(movement.movementIcon, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      movement.motivo,
                      style: AppText.caption,
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
                        style: AppText.captionInfo,
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.arrow_forward, size: 12, color: AppColors.accent),
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