import 'package:flutter/material.dart';
import 'package:sistema_libreria_app/data/models/supplier_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseFilters extends StatefulWidget {
  final List<SupplierModel> proveedores;
  final int? proveedorSeleccionado;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final String ordenSeleccionado;

  final ValueChanged<String> onSearchChanged;
  final ValueChanged<int?> onProveedorChanged;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;
  final ValueChanged<String> onSortChanged;

  const PurchaseFilters({
    super.key,
    required this.proveedores,
    required this.proveedorSeleccionado,
    required this.fechaInicio,
    required this.fechaFin,
    required this.ordenSeleccionado,
    required this.onSearchChanged,
    required this.onProveedorChanged,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onSortChanged,
  });

  @override
  State<PurchaseFilters> createState() => _PurchaseFiltersState();
}

class _PurchaseFiltersState extends State<PurchaseFilters> {
  String _formatearFecha(DateTime? fecha, String textoDefault) {
    if (fecha == null) return textoDefault;
    return '${fecha.day.toString().padLeft(2, '0')}/''${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  Future<void> _seleccionarFecha(bool esInicio) async {
    final fechaActual =
        esInicio ? widget.fechaInicio : widget.fechaFin;

    final seleccionada = await showDatePicker(
      context: context,
      initialDate: fechaActual ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2060),
    );

    if (seleccionada == null) return;

    if (esInicio &&
        widget.fechaFin != null &&
        seleccionada.isAfter(widget.fechaFin!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'La fecha inicial no puede ser posterior a la fecha final.',
          ),
        ),
      );
      return;
    }

    if (!esInicio &&
        widget.fechaInicio != null &&
        seleccionada.isBefore(widget.fechaInicio!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'La fecha final no puede ser anterior a la fecha inicial.',
          ),
        ),
      );
      return;
    }

    if (esInicio) {
      widget.onStartDateChanged(seleccionada);
    } else {
      widget.onEndDateChanged(seleccionada);
    }
  }

  String _nombreProveedorSeleccionado() {
    if (widget.proveedorSeleccionado == null) {
      return 'Todos';
    }

    for (final proveedor in widget.proveedores) {
      if (proveedor.id == widget.proveedorSeleccionado) {
        return proveedor.supplierName;
      }
    }

    return 'Todos';
  }

  String _nombreOrdenSeleccionado() {
    switch (widget.ordenSeleccionado) {
      case 'oldest':
        return 'Más antiguas';
      case 'amountAsc':
        return 'Menor total';
      case 'amountDesc':
        return 'Mayor total';
      case 'newest':
      default:
        return 'Más recientes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.borderLight,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 17,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: widget.onSearchChanged,
                      decoration: const InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: AppText.caption,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _seleccionarFecha(true),
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      _formatearFecha(widget.fechaInicio, 'Fecha inicial'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _seleccionarFecha(false),
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      _formatearFecha(widget.fechaFin, 'Fecha final'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: PopupMenuButton<int>(
                    onSelected: (id) {
                      widget.onProveedorChanged(id == 0 ? null : id);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text('Todos', style: AppText.body),
                      ),
                      ...widget.proveedores.map(
                        (proveedor) => PopupMenuItem<int>(
                          value: proveedor.id,
                          child: Text(
                            proveedor.supplierName,
                            style: AppText.body,
                          ),
                        ),
                      ),
                    ],
                    child: _filtro(
                      Icons.local_shipping_outlined,
                      'Proveedor',
                      subtitulo: _nombreProveedorSeleccionado(),
                      arrow: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: widget.onSortChanged,
                    itemBuilder: (context) => const [
                      PopupMenuItem<String>(
                        value: 'newest',
                        child: Text('Más recientes', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'oldest',
                        child: Text('Más antiguas', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'amountAsc',
                        child: Text('Menor total', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'amountDesc',
                        child: Text('Mayor total', style: AppText.body),
                      ),
                    ],
                    child: _filtro(
                      Icons.swap_vert,
                      'Ordenar por',
                      subtitulo: _nombreOrdenSeleccionado(),
                      arrow: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _filtro(
    IconData icon,
    String texto, {
    String? subtitulo,
    bool arrow = false,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: subtitulo == null
                ? Text(
                    texto,
                    style: AppText.captionPrimary,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        texto,
                        style: AppText.captionPrimary,
                      ),
                      Text(
                        subtitulo,
                        style: AppText.micro,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
          if (arrow)
            const Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }
}