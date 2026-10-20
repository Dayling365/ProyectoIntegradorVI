import 'package:flutter/material.dart';
import '../sales_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class SalesFilters extends StatelessWidget {
  final DateTime dateFrom;
  final DateTime dateTo;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final String selectedClient;
  final ValueChanged<String> onClientChanged;
  final VoidCallback onClear;

  const SalesFilters({
    super.key,
    required this.dateFrom,
    required this.dateTo,
    required this.onPickFrom,
    required this.onPickTo,
    required this.selectedClient,
    required this.onClientChanged,
    required this.onClear,
  });

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 17, color: AppColors.primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                    onTap: onPickFrom,
                    child: _filtro(Icons.calendar_today_outlined, formatDate(dateFrom)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: onPickTo,
                    child: _filtro(Icons.calendar_today_outlined, formatDate(dateTo)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: onClientChanged,
                    itemBuilder: (context) => kClients
                        .map(
                          (cliente) => PopupMenuItem<String>(
                            value: cliente,
                            child: Text(
                              cliente,
                              style: AppText.body,
                            ),
                          ),
                        )
                        .toList(),
                    child: _filtro(
                      Icons.person_outline,
                      'Cliente',
                      subtitulo: selectedClient,
                      arrow: true,
                    ),
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
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onClear,
                borderRadius: BorderRadius.circular(6),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close, size: 16, color: AppColors.primary),
                      SizedBox(width: 4),
                      Text(
                        'Limpiar filtros',
                        style: AppText.bodyStrongPrimary,
                      ),
                    ],
                  ),
                ),
              ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.primary),
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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