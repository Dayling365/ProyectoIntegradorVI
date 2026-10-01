import 'package:flutter/material.dart';
import '../sales_data.dart';

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
    const Color primary = Color(0xFF1B2A5C);
    const Color textSecondary = Color(0xFF8A94A6);
    const Color info = Color(0xFF2563EB);

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
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 17, color: primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: TextStyle(color: textSecondary, fontSize: 12),
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
                              style: const TextStyle(fontSize: 13),
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
                      Icon(Icons.close, size: 16, color: info),
                      SizedBox(width: 4),
                      Text(
                        'Limpiar filtros',
                        style: TextStyle(
                          color: info,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
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
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: const Color(0xFF1B2A5C)),
          const SizedBox(width: 8),
          Expanded(
            child: subtitulo == null
                ? Text(
                    texto,
                    style: const TextStyle(
                      color: Color(0xFF1B2A5C),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        texto,
                        style: const TextStyle(
                          color: Color(0xFF1B2A5C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF8A94A6),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
          ),
          if (arrow)
            const Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: Color(0xFF8A94A6),
            ),
        ],
      ),
    );
  }
}