import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets_inventory_movements/movement_filters.dart';
import 'widgets_inventory_movements/movement_summary.dart';
import 'widgets_inventory_movements/movement_list.dart';
import 'widgets_inventory_movements/movement_pagination.dart';

class InventoryMovementScreen extends StatelessWidget {
  const InventoryMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return AppScaffold(
      currentRoute: AppRoutes.inventoryMovement,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text( 'Movimiento de Inventario',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text( 'Consulta el historial de entradas, salidas y bajas de inventario.',
              style: TextStyle(
                color: textSecondary,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 16),

            const MovementFilters(),

            const SizedBox(height: 16),

            const MovementSummary(total: 42),

            const SizedBox(height: 12),

            const MovementList(),

            const SizedBox(height: 16),

            const MovementPagination(paginaActual: 1, totalPaginas: 5,
            ),
          ],
        ),
      ),
    );
  }
}