import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../app_state.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/category_sales_section.dart';
import 'widgets/low_stock_section.dart';
import 'widgets/stat_card.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.watch<AppState>().isAdmin;

    return AppScaffold(
      currentRoute: AppRoutes.dashboard,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAdmin ? '¡Hola, Administrador!' : '¡Hola, Vendedor!',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
             Text(
              isAdmin ? 'Aquí tienes un resumen de tu negocio hoy.' : 'Aquí tienes un resumen del negocio hoy.',
              style: AppText.bodySecondary,
            ),
            const SizedBox(height: 16),

            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.inventory),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.inventory_2_outlined, color: AppColors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Inventario General',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppColors.white),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.95,
              children: const [
                StatCard(
                  icon: Icons.point_of_sale,
                  iconColor: AppColors.info,
                  label: 'Ventas del día',
                  value: 'C\$124,500.00',
                ),

                StatCard(
                  icon: Icons.inventory_2,
                  iconColor: AppColors.warning,
                  label: 'Productos en inventario',
                  value: '1,245',
                ),

                StatCard(
                  icon: Icons.local_offer,
                  iconColor: AppColors.success,
                  label: 'Compras del mes',
                  value: '18',
                ),

                StatCard(
                  icon: Icons.people_outline,
                  iconColor: AppColors.info,
                  label: 'Clientes activos',
                  value: '156',
                ),
              ],
            ),

            const SizedBox(height: 20),

            const LowStockSection(),

            const SizedBox(height: 20),

            const CategorySalesSection(),
          ],
        ),
      ),
    );
  }
}
