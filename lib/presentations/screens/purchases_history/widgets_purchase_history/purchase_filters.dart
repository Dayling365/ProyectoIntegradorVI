import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class PurchaseFilters extends StatefulWidget {
  final ValueChanged<String> onProveedorChanged;

  const PurchaseFilters({super.key, required this.onProveedorChanged});

  @override
  State<PurchaseFilters> createState() => _PurchaseFiltersState();
}

class _PurchaseFiltersState extends State<PurchaseFilters> {
  DateTime? fechaInicio;
  DateTime? fechaFin;
    String proveedorSeleccionado = 'Todos';

  final List<String> proveedores = [
    'Todos',
    'Distribuidora Faber S.A.',
    'Útiles y Tintas del Pacífico',
    'Editorial Cervantes',
  ];

  String _formatearFecha(DateTime? fecha, String textoDefault) {
    if (fecha == null) return textoDefault;
    return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  Future<void> _seleccionarFecha(bool esInicio) async {
    final DateTime? seleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (seleccionada != null) {
      setState(() {
        if (esInicio) {
          fechaInicio = seleccionada;
        } else {
          fechaFin = seleccionada;
        }
      });
    }
  }

    void _seleccionarProveedor(String proveedor) {
    setState(() {
      proveedorSeleccionado = proveedor;
    });
    widget.onProveedorChanged(proveedor);
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
                      _formatearFecha(fechaInicio, '01/10/2026'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _seleccionarFecha(false),
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      _formatearFecha(fechaFin, '31/10/2026'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: _seleccionarProveedor,
                    itemBuilder: (context) => proveedores
                        .map(
                          (proveedor) => PopupMenuItem<String>(
                            value: proveedor,
                            child: Text(
                              proveedor,
                              style: AppText.body,
                            ),
                          ),
                        )
                        .toList(),
                    child: _filtro(
                      Icons.local_shipping_outlined,
                      'Proveedor',
                      subtitulo: proveedorSeleccionado,
                      arrow: true,)
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _filtro(
                    Icons.swap_vert,
                    'Ordenar por',
                    subtitulo: 'Más recientes',
                    arrow: true,
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