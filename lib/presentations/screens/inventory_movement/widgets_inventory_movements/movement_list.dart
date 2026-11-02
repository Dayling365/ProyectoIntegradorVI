import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/inventory_movement_model.dart';
import 'movement_item.dart';

class MovementList extends StatelessWidget {
  final List<InventoryMovementModel> movements;

  const MovementList({
    super.key,
    required this.movements,
  });

  String _formatDate(DateTime date) {
    final months = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];
    final hour = date.hour > 12
        ? date.hour - 12
        : date.hour == 0
            ? 12
            : date.hour;
    final suffix = date.hour >= 12 ? 'PM' : 'AM';
    final minute = date.minute.toString().padLeft(2, '0');

    return '${date.day} ${months[date.month - 1]} ${date.year} • $hour:$minute $suffix';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: movements.map((movement) {
        return MovementItem(
          id: movement.id,
          producto:
              movement.productName ?? 'Producto #${movement.productId}',
          tipo: movement.movementType,
          fecha: _formatDate(movement.dateTime),
          cantidad: movement.quantity,
          stockAntes: movement.stockBefore,
          stockDespues: movement.stockAfter,
          motivo: movement.reason ?? 'Sin motivo especificado',
        );
      }).toList(),
    );
  }
}