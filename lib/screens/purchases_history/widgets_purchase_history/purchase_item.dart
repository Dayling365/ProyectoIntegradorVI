import 'package:flutter/material.dart';
import '../../../app_routes.dart';

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
    const Color textPrimary = Color(0xFF17365D);
    const Color textSecondary = Color(0xFF7F8CA3);

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFE1E7EF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              codigo,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 3),
            Text('Proveedor: $proveedor',
              style: const TextStyle(
                fontSize: 12.5,
                color: textSecondary,
              ),
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
                    color: const Color(0xFFF1F4F8),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    fecha,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: textSecondary,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  monto,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
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
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: textPrimary,
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