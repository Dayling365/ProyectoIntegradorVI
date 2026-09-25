import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../models_product/product.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_product/product_header.dart';
import 'widgets_product/product_stats.dart';
import 'widgets_product/product_availability.dart';
import 'widgets_product/product_description.dart';
import 'widgets_product/back_to_inventory_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    final product = ModalRoute.of(context)!.settings.arguments as Product;

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
            ),
            const SizedBox(height: 4),
            const Text(
              'Información y movimientos registrados en inventario.',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            const SizedBox(height: 20),
            Center(child: ProductHeader(product: product)),
            const SizedBox(height: 20),
            ProductStats(product: product),
            const SizedBox(height: 12),
            ProductAvailability(product: product),
            const SizedBox(height: 20),
            ProductDescription(product: product),
            const SizedBox(height: 24),
            const BackToInventoryButton(),
          ],
        ),
      ),
    );
  }
}