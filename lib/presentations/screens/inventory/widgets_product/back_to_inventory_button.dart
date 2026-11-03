import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class BackToInventoryButton extends StatelessWidget {
  const BackToInventoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, size: 18, color: AppColors.primary),
        label: const Text('Volver a Inventario', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primary)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}