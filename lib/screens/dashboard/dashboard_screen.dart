import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_routes.dart';
import '../../app_state.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/category_sales_section.dart';
import 'widgets/low_stock_section.dart';
import 'widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color primary = Color(0xFF1B2A5C);
    const Color info = Color(0xFF2563EB);
    const Color warning = Color(0xFFF59E0B);
    const Color success = Color(0xFF16A34A);
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
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
             Text(
              isAdmin ? 'Aquí tienes un resumen de tu negocio hoy.' : 'Aquí tienes un resumen del negocio hoy.',
              style: TextStyle(color: textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 16),

            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.inventory),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.inventory_2_outlined, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Inventario General',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.white),
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
                  iconColor: info,
                  label: 'Ventas del día',
                  value: 'C\$124,500.00',
                ),

                StatCard(
                  icon: Icons.inventory_2,
                  iconColor: warning,
                  label: 'Productos en inventario',
                  value: '1,245',
                ),

                StatCard(
                  icon: Icons.local_offer,
                  iconColor: success,
                  label: 'Compras del mes',
                  value: '18',
                ),

                StatCard(
                  icon: Icons.people_outline,
                  iconColor: info,
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
