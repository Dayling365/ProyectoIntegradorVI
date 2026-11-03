import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/sale_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_sales_details/back_to_sales_history_button.dart';
import 'widgets_sales_details/sales_items_list.dart';
import 'widgets_sales_details/sales_summary.dart';

class SalesDetailsScreen extends StatefulWidget {
  const SalesDetailsScreen({super.key});

  @override
  State<SalesDetailsScreen> createState() => _SalesDetailsScreenState();
}

class _SalesDetailsScreenState extends State<SalesDetailsScreen> {
  bool _yaCargoDetalle = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_yaCargoDetalle) return;
    _yaCargoDetalle = true;

    final saleId = ModalRoute.of(context)!.settings.arguments as int;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<SaleProvider>().getSaleDetailsById(saleId);
      }
    });
  }

  String _dinero(double valor) {
    final partes = valor.toStringAsFixed(2).split('.');
    final entero = partes[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    return 'C\$$entero.${partes[1]}';
  }

  String _fecha(DateTime fecha) {
    final dia = fecha.day.toString().padLeft(2, '0');
    final mes = fecha.month.toString().padLeft(2, '0');
    final hora = fecha.hour.toString().padLeft(2, '0');
    final minuto = fecha.minute.toString().padLeft(2, '0');

    return '$dia/$mes/${fecha.year} · $hora:$minuto';
  }

  Widget _dato(IconData icono, String etiqueta, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icono, size: 15, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(etiqueta, style: AppText.bodySecondary),
          const Spacer(),
          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SaleProvider>();
    final sale = provider.selectedSale;

    return AppScaffold(
      currentRoute: AppRoutes.saleDetails,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Detalle de Venta', style: AppText.heading),
                const SizedBox(height: 4),
                const Text(
                  'Comprobante y desglose de factura emitida.',
                  style: AppText.bodySecondary,
                ),
                const SizedBox(height: 16),

                if (provider.isLoading && sale == null)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (provider.errorMessage != null && sale == null)
                  Text(
                    provider.errorMessage!,
                    style: const TextStyle(color: AppColors.error),
                  )
                else if (sale == null)
                  const Text(
                    'No se encontró la venta.',
                    style: AppText.bodySecondary,
                  )
                else ...[
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SalesSummary(
                          invoiceNumber: 'Venta #${sale.id}',
                          totalAmount: _dinero(sale.totalAmount),
                        ),
                        const SizedBox(height: 16),
                        _dato(
                          Icons.calendar_today_outlined,
                          'Fecha y hora',
                          _fecha(sale.saleDate),
                        ),
                        _dato(
                          Icons.person_outline,
                          'Cliente',
                          sale.costumerTypeName ?? 'Sin tipo',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  SalesItemsList(items: sale.details),
                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RESUMEN DE VENTA',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _dato(
                          Icons.receipt_outlined,
                          'Subtotal',
                          _dinero(sale.totalAmount),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Total',
                              style: AppText.bodySecondary,
                            ),
                            const Spacer(),
                            Text(
                              _dinero(sale.totalAmount),
                              style: AppText.titlePrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const BackToSalesHistoryButton(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}