import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../../data/models/inventory_movement_model.dart';
import '../../providers/inventory_movement_provider.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';

class MovementDetailsScreen extends StatefulWidget {
  const MovementDetailsScreen({super.key});

  @override
  State<MovementDetailsScreen> createState() => _MovementDetailsScreenState();
}

class _MovementDetailsScreenState extends State<MovementDetailsScreen> {
  bool _loaded = false;
  int? _movementId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is int) {
        _movementId = args;
      } else if (args is String) {
        _movementId = int.tryParse(args);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadMovement());
    }
  }

  void _loadMovement() {
    if (_movementId != null) {
      context.read<InventoryMovementProvider>().getMovementDetails(_movementId!);
    }
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'entrada':
        return const Color(0xFF16A34A);
      case 'salida':
        return const Color(0xFFDC2626);
      case 'ajuste':
        return const Color(0xFFD97706);
      case 'baja':
        return const Color(0xFF9333EA);
      default:
        return const Color(0xFF2563EB);
    }
  }

  Color _getTypeBgColor(String type) {
    switch (type.toLowerCase()) {
      case 'entrada':
        return const Color(0x1A16A34A);
      case 'salida':
        return const Color(0x1ADC2626);
      case 'ajuste':
        return const Color(0x1AD97706);
      case 'baja':
        return const Color(0x1A9333EA);
      default:
        return const Color(0x1A2563EB);
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'entrada':
        return Icons.arrow_downward;
      case 'salida':
        return Icons.arrow_upward;
      case 'ajuste':
        return Icons.tune;
      case 'baja':
        return Icons.remove_circle_outline;
      default:
        return Icons.swap_vert;
    }
  }

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
    final provider = context.watch<InventoryMovementProvider>();

    return AppScaffold(
      currentRoute: AppRoutes.inventoryMovementDetails,
      showBack: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            _buildContent(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(InventoryMovementProvider provider) {
    if (_movementId == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: ErrorView(message: 'No se indicó qué movimiento mostrar.'),
        ),
      );
    }

    switch (provider.viewStatus) {
      case ViewStatus.initial:
      case ViewStatus.loading:
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: LoadingView(message: 'Cargando detalle del movimiento...'),
          ),
        );

      case ViewStatus.error:
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: ErrorView(
              message: provider.errorMessage ?? 'No se pudo cargar el movimiento.',
              onRetry: _loadMovement,
            ),
          ),
        );

      case ViewStatus.success:
        final movement = provider.selectedMovement;
        if (movement == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: ErrorView(
                message: 'No se encontró la información del movimiento.',
              ),
            ),
          );
        }
        return _buildMovementDetails(movement);
    }
  }

  Widget _buildMovementDetails(InventoryMovementModel movement) {
    final typeColor = _getTypeColor(movement.movementType);
    final typeBgColor = _getTypeBgColor(movement.movementType);
    final typeIcon = _getTypeIcon(movement.movementType);
    final isEntrada = movement.movementType.toLowerCase() == 'entrada';
    final sign = isEntrada ? '+' : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                            '#${movement.id.toString().padLeft(4, '0')}',
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: typeBgColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(typeIcon, size: 13, color: typeColor),
                          const SizedBox(width: 4),
                          Text(
                            movement.movementType,
                            style: TextStyle(
                              color: typeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 14,
                ),
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
                            '$sign${movement.quantity}',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: typeColor,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              'unid.',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
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
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${movement.stockBefore} unid.',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF16233F),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward,
                              size: 13,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Stock final: ',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${movement.stockAfter} unid.',
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
              _infoRow(
                Icons.calendar_today_outlined,
                'Fecha y hora',
                _formatDate(movement.dateTime),
              ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: typeBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: typeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movement.movementType,
                          style: TextStyle(
                            color: typeColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (movement.purchaseId != null) ...[
                const SizedBox(height: 12),
                _infoRow(
                  Icons.shopping_bag_outlined,
                  'ID Compra asociada',
                  '#${movement.purchaseId}',
                ),
              ],
              if (movement.saleId != null) ...[
                const SizedBox(height: 12),
                _infoRow(
                  Icons.receipt_outlined,
                  'ID Venta asociada',
                  '#${movement.saleId}',
                ),
              ],
              const SizedBox(height: 12),
              const Divider(height: 1, color: Color(0xFFEDEDED)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    size: 16,
                    color: Colors.grey[600],
                  ),
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
                  movement.reason != null && movement.reason!.isNotEmpty
                      ? '"${movement.reason}"'
                      : 'Sin motivo especificado.',
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
                  const Icon(
                    Icons.inventory_2_outlined,
                    size: 18,
                    color: Color(0xFF16233F),
                  ),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'Producto afectado',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF3FB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Cód. Producto: #${movement.productId}',
                        style: const TextStyle(
                          color: Color(0xFF3B82F6),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: Color(0xFFEDEDED)),
              const SizedBox(height: 12),
              Text(
                movement.productName ?? 'Producto #${movement.productId}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF16233F),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'ID Inventario: #${movement.inventoryId}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: typeBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      movement.movementType,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: typeColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CANTIDAD INVOLUCRADA',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$sign${movement.quantity} unidades',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF16233F),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'VARIACIÓN DE STOCK',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${movement.stockBefore} → ${movement.stockAfter} unidades',
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
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 18,
              color: Color(0xFF16233F),
            ),
            label: const Text(
              'Volver al Historial de Movimientos',
              style: TextStyle(
                color: Color(0xFF16233F),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF16233F)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
        const SizedBox(height: 16),
      ],
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
