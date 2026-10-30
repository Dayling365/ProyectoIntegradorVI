import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sistema_libreria_app/core/di/injection.dart';
import 'package:sistema_libreria_app/presentations/app_state.dart';
import 'package:sistema_libreria_app/presentations/providers/auth_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/user_provider.dart';
import 'core/constant/app_routes.dart';
import 'presentations/screens/dashboard/dashboard_screen.dart';
import 'presentations/screens/login/login_screen.dart';
import 'presentations/screens/inventory/inventory_screen.dart';
import 'presentations/screens/logs/logs_screen.dart';
import 'presentations/screens/preferences/preferences_screen.dart';
import 'presentations/screens/inventory/product_details_screen.dart';
import 'presentations/screens/purchases_history/purchase_history_screen.dart';
import 'presentations/screens/purchases_history/purchases_details_screen.dart';
import 'presentations/screens/sales_history/sales_history_screen.dart';
import 'presentations/screens/sales_history/sales_details_screen.dart';
import 'presentations/screens/alert_stock/alert_stock_screen.dart';
import 'presentations/screens/inventory_movement/inventory_movement_screen.dart';
import 'presentations/screens/inventory_movement/movement_details_screen.dart';
import 'presentations/screens/users/users_screen.dart';
import 'presentations/screens/report/report_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<UserProvider>()),
      ],
      child: const MyApp(),
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
        AppRoutes.inventoryMovementDetails: (context) => const MovementDetailsScreen(),
        AppRoutes.productDetails: (context) => const ProductDetailsScreen(),
      },
    );
  }
}
