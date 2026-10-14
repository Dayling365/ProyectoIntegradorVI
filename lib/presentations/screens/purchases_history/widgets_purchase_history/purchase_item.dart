import 'package:flutter/material.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseItem extends StatelessWidget {
  final String codigo;
  final String proveedor;
  final String fecha;
  final String monto;

  const PurchaseItem({
    super.key,
    required this.codigo,
    required this.proveedor,
    required this.fecha,
    required this.monto,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.purchaseDetails,
        arguments: codigo,
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
            Text(
              codigo,
              style: AppText.subtitle,
            ),
            const SizedBox(height: 3),
            Text('Proveedor: $proveedor',
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
                  monto,
                  style: AppText.title,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Ver detalle',
                    style: AppText.captionInfo,
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: AppColors.accent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}