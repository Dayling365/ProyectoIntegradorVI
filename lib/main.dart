import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'screens/dashboard/dashboard.screen.dart';
import 'screens/report/report_screen.dart';

void main() {
  runApp(const MyApp());
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
        AppRoutes.login: (context) => const DashboardScreen(), 
        AppRoutes.inventory: (context) => const DashboardScreen(),
        AppRoutes.logs: (context) => const DashboardScreen(),
        AppRoutes.preferences: (context) => const DashboardScreen(),
        AppRoutes.purchasesHistory: (context) => const DashboardScreen(),
        AppRoutes.salesHistory: (context) => const DashboardScreen(),
        AppRoutes.users: (context) => const DashboardScreen(),
        AppRoutes.report: (context) => const DashboardScreen(),

       
      },
     
    );
  }
}
