import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/view_status.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import 'widgets_product/product_header.dart';
import 'widgets_product/product_stats.dart';
import 'widgets_product/product_availability.dart';
import 'widgets_product/product_description.dart';
import 'widgets_product/back_to_inventory_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _loaded = false;
  int? _productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _productId = ModalRoute.of(context)?.settings.arguments as int?;
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadProduct());
    }
  }

  void _loadProduct() {
    if (_productId != null) {
      context.read<InventoryProvider>().fetchProductDetail(_productId!);
    }
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<InventoryProvider>();

    return AppScaffold(
      currentRoute: AppRoutes.productDetails,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalle de Producto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 4),
            const Text(
              'Información y movimientos registrados en inventario.',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            _buildContent(provider),
            const SizedBox(height: 24),
            const BackToInventoryButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(InventoryProvider provider) {
    if (_productId == null) {
      return const ErrorView(message: 'No se indicó qué producto mostrar.');
    }

    final item = provider.selectedItem;

    switch (provider.detailStatus) {
      case ViewStatus.initial:
      case ViewStatus.loading:
        return const LoadingView(message: 'Cargando producto...');

      case ViewStatus.error:
        return ErrorView(
          message: provider.detailErrorMessage ?? 'No se pudo cargar el producto.',
          onRetry: _loadProduct,
        );

      case ViewStatus.success:
        if (item == null) {
          return const ErrorView(message: 'No se pudo cargar el producto.');
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: ProductHeader(item: item)),
            const SizedBox(height: 20),
            ProductStats(item: item),
            const SizedBox(height: 12),
            ProductAvailability(item: item, level: provider.selectedAvailability),
            const SizedBox(height: 20),
            ProductDescription(item: item),
          ],
        );
    }
  }
}
