import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_purchase_details/purchase_detail_info.dart';
import 'widgets_purchase_details/detail_items_list.dart';
import 'widgets_purchase_details/purchase_detail_summary.dart';
import 'widgets_purchase_details/back_to_history_button.dart';

class PurchaseDetailScreen extends StatelessWidget {
  const PurchaseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return AppScaffold(
      currentRoute: AppRoutes.purchasesHistory,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.88,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Detalle de Compra',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),

                const SizedBox(height: 4),

                const Text('Comprobante y desglose de orden de compra recibida.',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 16),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('MONTO TOTAL DE LA COMPRA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('C\$6,450.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17365D),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                const PurchaseDetailInfo(
                  fecha: '23 Oct 2026 • 11:45 AM',
                  proveedor: 'Distribuidora Faber S.A.',
                  registradoPor: 'Don César Admin',
                ),

                const SizedBox(height: 16),

                const DetailItemsList(
                  totalItems: 3,
                ),

                const SizedBox(height: 16),

                const PurchaseDetailSummary(
                  subtotal: 'C\$5,608.70',
                  totalNeto: 'C\$6,450.00',
                  montoPagado: 'C\$6,450.00',
                ),

                const SizedBox(height: 20),

                const BackToHistoryButton(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}