import 'package:flutter/material.dart'; 
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseDetailInfo extends StatelessWidget { 
  final String codigo; 

  const PurchaseDetailInfo({ 
    super.key, 
    required this.codigo, 
  }); 

  @override 
  Widget build(BuildContext context) { 

    String fecha = ''; 
    String proveedor = ''; 
    String registradoPor = ''; 
    String totalAmount = ''; 

    switch (codigo) { 
      case 'Compra #CP-2026-088': 
        fecha = '23 Oct 2026 • 11:45 AM'; 
        proveedor = 'Distribuidora Faber S.A.'; 
        registradoPor = 'Don César Admin'; 
        totalAmount = 'C\$6,450.00'; 
        break; 

      case 'Compra #CP-2026-087': 
        fecha = '21 Oct 2026 • 09:15 AM'; 
        proveedor = 'Útiles y Tintas del Pacífico'; 
        registradoPor = 'María López'; 
        totalAmount = 'C\$4,120.00'; 
        break; 

      case 'Compra #CP-2026-086': 
        fecha = '18 Oct 2026 • 04:30 PM'; 
        proveedor = 'Editorial Cervantes'; 
        registradoPor = 'Don César Admin'; 
        totalAmount = 'C\$8,900.00'; 
        break; 
    } 

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 

        Text('FOLIO: $codigo',
          style: const TextStyle(
            fontSize: 11, fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              const Text('MONTO TOTAL FACTURADO',
                style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                totalAmount,
                style: AppTextTheme.textTheme.displayLarge,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16), 

        _fila( 
          icon: Icons.calendar_today_outlined, 
          etiqueta: 'Fecha y hora', 
          valor: fecha, 
        ), 

        const SizedBox(height: 10), 

        _fila( 
          icon: Icons.local_shipping_outlined, 
          etiqueta: 'Proveedor', 
          valor: proveedor, 
        ), 

        const SizedBox(height: 10), 

        Row( 
          children: [ 
            const Icon( 
              Icons.person_outline, 
              size: 16, 
              color: AppColors.textSecondary, 
            ), 
            const SizedBox(width: 8), 
            const Text('Registrado por', 
              style: AppText.bodySecondary, 
            ), 
            const Spacer(), 
            Container( 
              padding: const EdgeInsets.symmetric( 
                horizontal: 10, 
                vertical: 4, 
              ), 
              decoration: BoxDecoration( 
                color: AppColors.success.withValues(alpha: 0.1), 
                borderRadius: BorderRadius.circular(20), 
              ), 
              child: Text( 
                registradoPor, 
                style: const TextStyle( 
                  fontSize: 12, 
                  color: AppColors.success, 
                  fontWeight: FontWeight.w600, 
                ), 
              ), 
            ), 
          ], 
        ), 
      ], 
      ), 
    ); 
  } 

  Widget _fila({ 
    required IconData icon, 
    required String etiqueta, 
    required String valor, 
  }) { 
    return Row( 
      children: [ 
        Icon(icon, size: 16, color: AppColors.textSecondary), 
        const SizedBox(width: 8), 
        Text( 
          etiqueta, 
          style: AppText.bodySecondary, 
        ), 
        const Spacer(), 
        Text( 
          valor, 
          style: AppText.bodyStrong, 
        ), 
      ], 
    ); 
  } 
}