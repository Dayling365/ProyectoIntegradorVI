import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_icons.dart';
import '../../../theme/app_text_theme.dart';

class LogsFiltros extends StatelessWidget {
  final List<String> usuarios;
  final String? usuarioSeleccionado;
  final String? estadoSeleccionado;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final ValueChanged<String?> onUsuarioChanged;
  final ValueChanged<String?> onEstadoChanged;
  final ValueChanged<DateTime?> onFechaInicioChanged;
  final ValueChanged<DateTime?> onFechaFinChanged;
  final VoidCallback onLimpiarFiltros;

  const LogsFiltros({
    super.key,
    required this.usuarios,
    required this.usuarioSeleccionado,
    required this.estadoSeleccionado,
    required this.fechaInicio,
    required this.fechaFin,
    required this.onUsuarioChanged,
    required this.onEstadoChanged,
    required this.onFechaInicioChanged,
    required this.onFechaFinChanged,
    required this.onLimpiarFiltros,
  });

  @override
  Widget build(BuildContext context) {
    final usuariosUnicos = usuarios.toSet().toList()..sort();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _filtroFecha(context, AppIcons.calendar,
                    'Desde',fechaInicio, onFechaInicioChanged),),
                const SizedBox(width: 8),
                Expanded(
                  child: _filtroFecha(
                    context, AppIcons.calendar, 'Hasta', fechaFin, onFechaFinChanged),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _filtroSeleccion(
                    icon: AppIcons.person,
                    texto: 'Usuario',
                    valor: usuarioSeleccionado ?? 'Todos',
                    opciones: ['Todos', ...usuariosUnicos],
                    onChanged: (valor) {
                      onUsuarioChanged(valor == 'Todos' ? null : valor);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _filtroSeleccion(
                    icon: Icons.toggle_off_outlined,
                    texto: 'Estado',
                    valor: estadoSeleccionado ?? 'Todos',
                    opciones: const ['Todos', 'Exitoso', 'Fallido'],
                    onChanged: (valor) {
                      onEstadoChanged(valor == 'Todos' ? null : valor);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onLimpiarFiltros,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.link,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Limpiar filtros',
                      style: TextStyle(
                        color: AppColors.link,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filtroFecha(
    BuildContext context,
    IconData icon,
    String texto,
    DateTime? fecha,
    ValueChanged<DateTime?> onChanged,
  ) {
    return InkWell(
      onTap: () async {
        final seleccionada = await showDatePicker(
          context: context,
          initialDate: fecha ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (seleccionada != null) {
          onChanged(seleccionada);
        }
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            Icon(icon, size: 17, color: AppColors.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                fecha == null ? texto : _formatearFecha(fecha),
                style: AppText.captionPrimary,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filtroSeleccion({
    required IconData icon,
    required String texto,
    required String valor,
    required List<String> opciones,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: opciones.contains(valor) ? valor : 'Todos',
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                selectedItemBuilder: (context) {
                  return opciones.map((opcion) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(texto, style: AppText.captionPrimary),
                          Text(opcion, style: AppText.micro),
                        ],
                      ),
                    );
                  }).toList();
                },
                items: opciones.map((opcion) {
                  return DropdownMenuItem<String>(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
                onChanged: (nuevoValor) {
                  if (nuevoValor != null) {
                    onChanged(nuevoValor);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatearFecha(DateTime fecha) {
    final dia = fecha.day.toString().padLeft(2, '0');
    final mes = fecha.month.toString().padLeft(2, '0');
    return '$dia/$mes/${fecha.year}';
  }
}