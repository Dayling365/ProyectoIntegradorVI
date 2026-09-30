import 'package:flutter/material.dart';
import 'movement_item.dart';
import '../../models_movement/movement.dart';

class MovementList extends StatelessWidget {
  const MovementList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: demoMovements.map((m) => MovementItem(movement: m)).toList(),
    );
  }
}