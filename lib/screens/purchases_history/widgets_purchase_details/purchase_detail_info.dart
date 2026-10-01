import 'package:flutter/material.dart'; 

class PurchaseDetailInfo extends StatelessWidget { 
  final String codigo; 

  const PurchaseDetailInfo({ 
    super.key, 
    required this.codigo, 
  }); 

  @override 
  Widget build(BuildContext context) { 
    const Color textPrimary = Color(0xFF1A1F36); 
    const Color textSecondary = Color(0xFF8A94A6); 
    const Color success = Color(0xFF16A34A); 

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 

        Text('FOLIO: $codigo',
          style: const TextStyle(
            fontSize: 11, fontWeight: FontWeight.w600,
            color: Color(0xFF8A94A6),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            children: [
              const Text('MONTO TOTAL FACTURADO',
                style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600,
                  color: Color(0xFF8A94A6),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                totalAmount,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B2A5C),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16), 

        _fila( 
          icon: Icons.calendar_today_outlined, 
          etiqueta: 'Fecha y hora', 
          valor: fecha, 
          textPrimary: textPrimary, 
          textSecondary: textSecondary, 
        ), 

        const SizedBox(height: 10), 

        _fila( 
          icon: Icons.local_shipping_outlined, 
          etiqueta: 'Proveedor', 
          valor: proveedor, 
          textPrimary: textPrimary, 
          textSecondary: textSecondary, 
        ), 

        const SizedBox(height: 10), 

        Row( 
          children: [ 
            const Icon( 
              Icons.person_outline, 
              size: 16, 
              color: textSecondary, 
            ), 
            const SizedBox(width: 8), 
            const Text('Registrado por', 
              style: TextStyle(fontSize: 13, color: textSecondary), 
            ), 
            const Spacer(), 
            Container( 
              padding: const EdgeInsets.symmetric( 
                horizontal: 10, 
                vertical: 4, 
              ), 
              decoration: BoxDecoration( 
                color: success.withOpacity(0.1), 
                borderRadius: BorderRadius.circular(20), 
              ), 
              child: Text( 
                registradoPor, 
                style: const TextStyle( 
                  fontSize: 12, 
                  color: success, 
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
    required Color textPrimary, 
    required Color textSecondary, 
  }) { 
    return Row( 
      children: [ 
        Icon(icon, size: 16, color: textSecondary), 
        const SizedBox(width: 8), 
        Text( 
          etiqueta, 
          style: TextStyle(fontSize: 13, color: textSecondary), 
        ), 
        const Spacer(), 
        Text( 
          valor, 
          style: TextStyle( 
            fontSize: 13, 
            fontWeight: FontWeight.w600, 
            color: textPrimary, 
          ), 
        ), 
      ], 
    ); 
  } 
}