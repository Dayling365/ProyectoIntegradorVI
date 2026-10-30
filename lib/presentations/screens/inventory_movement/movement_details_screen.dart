import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';
import '../../../core/constant/app_routes.dart';

class MovementDetailsScreen extends StatelessWidget {
  final String registroId;
  final String movementLabel;
  final Color movementColor;
  final Color movementBgColor;
  final IconData movementIcon;
  final int cantidadInvolucrada;
  final int stockPrevio;
  final int stockFinal;
  final String fechaHora;
  final String motivo;
  final String codigoProducto;
  final String productName;
  final String sku;
  final String category;
  final int cantidadIngresada;
  final double costoUnitario;
  final double valorTotalLote;

  const MovementDetailsScreen({
    super.key,
    this.registroId = '0000',
    this.movementLabel = 'Entrada',
    this.movementColor = const Color(0xFF16A34A),
    this.movementBgColor = const Color(0x1A16A34A),
    this.movementIcon = Icons.swap_vert,
    this.cantidadInvolucrada = 0,
    this.stockPrevio = 0,
    this.stockFinal = 0,
    this.fechaHora = '',
    this.motivo = '',
    this.codigoProducto = '',
    this.productName = '',
    this.sku = '',
    this.category = '',
    this.cantidadIngresada = 0,
    this.costoUnitario = 0,
    this.valorTotalLote = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      drawer: const AppDrawer(currentRoute: AppRoutes.inventoryMovementDetails),
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.menu_book, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text('Librería Don César', style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Icon(Icons.person, color: Color(0xFF16233F), size: 18),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Encabezado
            const Text(
              'Detalle de Movimiento',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16233F),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Comprobante y registro detallado del movimiento de inventario.',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),

            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // N° de registro + badge de tipo
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'N° DE REGISTRO: ',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '#$registroId',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xFF16233F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: movementBgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(movementIcon, size: 13, color: movementColor),
                                const SizedBox(width: 4),
                                Text(
                                  movementLabel,
                                  style: TextStyle(
                                    color: movementColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFEDEDED)),
                  const SizedBox(height: 16),

                  
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF3FB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'CANTIDAD INVOLUCRADA',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${cantidadInvolucrada >= 0 ? '+' : ''}$cantidadInvolucrada',
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF16A34A),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  'unid.',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Stock previo: ',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                                Text(
                                  '$stockPrevio unid.',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF16233F),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Icon(Icons.arrow_forward, size: 13, color: Colors.grey[500]),
                                const SizedBox(width: 6),
                                Text(
                                  'Stock final: ',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                                Text(
                                  '$stockFinal unid.',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF16233F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  
                  _infoRow(Icons.calendar_today_outlined, 'Fecha y hora', fechaHora),
                  const SizedBox(height: 12),

                  
                  Row(
                    children: [
                      Icon(Icons.swap_vert, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Tipo de movimiento',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: movementBgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(color: movementColor, shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movementLabel,
                              style: TextStyle(
                                color: movementColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFEDEDED)),
                  const SizedBox(height: 12),

                  
                  Row(
                    children: [
                      Icon(Icons.local_offer_outlined, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 6),
                      Text(
                        'MOTIVO O JUSTIFICACIÓN:',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '"$motivo"',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Color(0xFF16233F),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.inventory_2_outlined, size: 18, color: Color(0xFF16233F)),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: Text(
                          'Producto afectado',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF3FB),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Cód. Producto: #$codigoProducto',
                              style: const TextStyle(
                                color: Color(0xFF3B82F6),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1, color: Color(0xFFEDEDED)),
                  const SizedBox(height: 12),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xFF16233F),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              runSpacing: 4,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'SKU: $sku',
                                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  '•  $category',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'C\$${valorTotalLote.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF16233F),
                            ),
                          ),
                          Text(
                            'Valor total lote',
                            style: TextStyle(color: Colors.grey[500], fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CANTIDAD INGRESADA',
                          style: TextStyle(color: Colors.grey[500], fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+$cantidadIngresada unidades',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF16233F),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'COSTO UNITARIO COMPRA',
                          style: TextStyle(color: Colors.grey[500], fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'C\$${costoUnitario.toStringAsFixed(2)} / un.',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF16233F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 18, color: Color(0xFF16233F)),
                label: const Text(
                  'Volver al Historial de Movimientos',
                  style: TextStyle(color: Color(0xFF16233F), fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFF16233F)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Comprobante digital registrado en el sistema • Solo lectura',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16233F),
            ),
          ),
        ),
      ],
    );
  }
}