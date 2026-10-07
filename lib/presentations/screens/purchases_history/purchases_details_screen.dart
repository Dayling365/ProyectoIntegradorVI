import 'package:flutter/material.dart'; 
import '../../../core/constant/app_routes.dart'; 
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

    final codigo = ModalRoute.of(context)?.settings.arguments as String? ?? ''; 

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

                PurchaseDetailInfo( 
                  codigo: codigo, 
                ), 

                const SizedBox(height: 16), 

                DetailItemsList( 
                  codigo: codigo, 
                ), 

                const SizedBox(height: 16), 

                PurchaseDetailSummary(
                  codigo: codigo, 
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