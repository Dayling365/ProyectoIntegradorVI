import 'package:flutter/material.dart';
import 'app_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String currentRoute;
  final bool showBack;

  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.body,
    required this.currentRoute,
    this.showBack = false,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A5C),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.menu_book, size: 20),
            SizedBox(width: 8),
            Text(
              'Librería Don César',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions:
            actions ??
            const [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.account_circle, size: 28),
              ),
            ],
      ),
      // Si es detalle no hay drawer: Flutter pone la flecha automaticamente.
      drawer: showBack ? null : AppDrawer(currentRoute: currentRoute),
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
