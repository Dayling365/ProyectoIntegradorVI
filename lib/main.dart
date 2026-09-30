import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_routes.dart';
import "app_state.dart";
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/inventory/inventory_screen.dart';
import 'screens/logs/logs_screen.dart';
import 'screens/preferences/preferences_screen.dart';
import 'screens/inventory/product_details_screen.dart';
import 'screens/purchases_history/purchase_history_screen.dart';
import 'screens/purchases_history/purchases_details_screen.dart';
import 'screens/sales_history/sales_history_screen.dart';
import 'screens/sales_history/sales_details_screen.dart';
import 'screens/alert_stock/alert_stock_screen.dart';
import 'screens/inventory_movement/inventory_movement_screen.dart';
import 'screens/inventory_movement/inventory_movement_details_screen.dart';
import 'screens/users/users_screen.dart';
import 'screens/report/report_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
     child: const MyApp()
     ),
 );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Librería Don César',
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.inventory: (context) => const InventoryScreen(),
        AppRoutes.logs: (context) => const LogsScreen(),
        AppRoutes.preferences: (context) => const PreferencesScreen(),
        AppRoutes.purchasesHistory: (context) => const PurchasesHistoryScreen(),
        AppRoutes.salesHistory: (context) => const SalesHistoryScreen(),
        AppRoutes.users: (context) => const UsersScreen(),
        AppRoutes.report: (context) => const ReportScreen(),
        AppRoutes.saleDetails: (context) => const SalesDetailsScreen(),
        AppRoutes.purchaseDetails: (context) => const PurchaseDetailScreen(),
        AppRoutes.alertStock: (context) => const AlertStockScreen(),
        AppRoutes.inventoryMovement: (context) => const InventoryMovementScreen(),
        AppRoutes.inventoryMovementDetails: (context) => const InventoryMovementDetailsScreen(),
        AppRoutes.productDetails: (context) => const ProductDetailsScreen(),
        
      },
    );
  }
}
