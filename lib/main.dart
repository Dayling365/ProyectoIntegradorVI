import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'screens/dashboard/dashboard.screen.dart';

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
      initialRoute: AppRoutes.dashboard, // ISRAEL DEBES DE CAMBIAR A QUI POR EL DE LOGIN CUANDO LO TENGAS
      routes: {
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        // Agregar las demás rutas aquí
      },
     
    );
  }
}
