import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/purchase_provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_purchase_details/purchase_detail_info.dart';
import 'widgets_purchase_details/detail_items_list.dart';
import 'widgets_purchase_details/purchase_detail_summary.dart';
import 'widgets_purchase_details/back_to_history_button.dart';
import '../../theme/app_text_theme.dart';

class PurchaseDetailScreen extends StatefulWidget {
  const PurchaseDetailScreen({super.key});

  @override
  State<PurchaseDetailScreen> createState() => _PurchaseDetailScreenState();
}

class _PurchaseDetailScreenState extends State<PurchaseDetailScreen> {
  bool _loaded = false;

 Future<void> _loadPurchase() async {
    final purchaseId = ModalRoute.of(context)?.settings.arguments as int?;

    if (purchaseId != null) {
      await context.read<PurchaseProvider>().getPurchaseDetails(purchaseId);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _loadPurchase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PurchaseProvider>();
    final purchase = provider.selectedPurchase;

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
                style: AppText.heading,
                ),

                const SizedBox(height: 4),

                const Text('Comprobante y desglose de orden de compra recibida.',
                  style: AppText.bodySecondary,
                ),
                
                const SizedBox(height: 16),
                if (purchase == null)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else ...[
                  PurchaseDetailInfo(purchase: purchase),
                  const SizedBox(height: 16),
                  DetailItemsList(purchase: purchase),
                  const SizedBox(height: 16),
                  PurchaseDetailSummary(purchase: purchase),
                  const SizedBox(height: 20),
                  const BackToHistoryButton(),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}