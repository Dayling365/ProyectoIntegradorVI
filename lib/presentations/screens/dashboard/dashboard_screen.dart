import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/low_stock_section.dart';
import 'widgets/stat_card.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';
import '../../providers/dashboard_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(!mounted) return;
      final isAdmin = context.read<AuthProvider>().user?.isAdmin ?? false;
      context.read<DashboardProvider>().load(isAdmin: isAdmin);
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    final isAdmin = user?.isAdmin ?? false;
    final dashboard = context.watch<DashboardProvider>();
    final error = dashboard.errorMessage;
    

    final purchasesValue = dashboard.isLoading
        ? 'Cargando...'
        : dashboard.purchaseThisMonth?.toString() ?? '-';
    final salesValue = dashboard.isLoading
    ? 'Cargando...'
    : dashboard.salesTodayTotal == null
        ? '—'
        : 'C\$${dashboard.salesTodayTotal!.toStringAsFixed(2)}';
    final salesCountValue = dashboard.isLoading
      ? 'Cargando...'
      : dashboard.salesTodayCount?.toString() ?? '—';
    final inventoryValue = dashboard.isLoading
    ? 'Cargando...'
    : dashboard.unitsInInventory?.toString() ?? '—';

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
              children: [
                StatCard(
                  icon: Icons.point_of_sale,
                  iconColor: AppColors.info,
                  label: 'Ventas del día',
                  value: salesValue,
                ),

                StatCard(
                  icon: Icons.inventory_2,
                  iconColor: AppColors.warning,
                  label: 'Productos en inventario',
                  value: inventoryValue,
                ),
                
                if (isAdmin) 
                  StatCard(
                    icon: Icons.local_offer,
                    iconColor: AppColors.success,
                    label: 'Compras del mes',
                    value: purchasesValue,
                  ),

                StatCard(
                  icon: Icons.receipt_long,
                  iconColor: AppColors.info,
                  label: 'Ventas registradas hoy',
                  value: salesCountValue,
                ),
              ],
            ),

            if (error != null) ...[
              const SizedBox(height: 8),
              Text(error, style: const TextStyle(color: AppColors.error)),

            ],

            const SizedBox(height: 20),

            LowStockSection(
              items: dashboard.inventoryItems
                  .where((item) => item.isLowStock || item.unitsInStock <= item.minStock)
                  .toList(),
              isLoading: dashboard.isLoading,
            ),

          ],
        ),
      ),
    );
  }
}
