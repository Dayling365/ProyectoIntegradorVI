import 'package:flutter/material.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementItem extends StatelessWidget {
  final int id;
  final String producto;
  final String tipo;
  final String fecha;
  final int cantidad;
  final int stockAntes;
  final int stockDespues;
  final String motivo;

  const MovementItem({
    super.key,
    required this.id,
    required this.producto,
    required this.tipo,
    required this.fecha,
    required this.cantidad,
    required this.stockAntes,
    required this.stockDespues,
    required this.motivo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.inventoryMovementDetails,
        arguments: id,
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(producto, style: AppText.subtitle),
            const SizedBox(height: 3),
            Text(
              'Tipo: $tipo',
              style: AppText.caption,
            ),
            const SizedBox(height: 17),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceMuted,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    fecha,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '$cantidad unidades',
                  style: AppText.title,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'Stock: $stockAntes → $stockDespues unidades',
              style: AppText.bodyStrong,
            ),
            const SizedBox(height: 4),
            Text(
              'Motivo: $motivo',
              style: AppText.caption,
            ),
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ver detalle',
                  style: AppText.captionInfo,
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 14, color: AppColors.accent,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}