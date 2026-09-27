import 'package:flutter/material.dart';

class BackToHistoryButton extends StatelessWidget {
  const BackToHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, size: 18, color: Color(0xFF1B2A5C)),
        label: const Text('Volver a Historial de Compras', style: TextStyle(fontSize: 14, 
        fontWeight: FontWeight.w600, color: Color(0xFF1B2A5C))),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}