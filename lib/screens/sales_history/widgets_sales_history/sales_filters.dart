import 'package:flutter/material.dart';

class SalesFilters extends StatelessWidget {
  const SalesFilters({super.key});

  static const Color primary = Color(0xFF1B2A5C);
  static const Color textSecondary = Color(0xFF8A94A6);
  static const Color info = Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buscador (mismo estilo que compra)
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

        // Fechas: SIN flecha de dropdown
        Row(
          children: [
            Expanded(child: _filtro(Icons.calendar_today_outlined, '01/10/2026')),
            const SizedBox(width: 8),
            Expanded(child: _filtro(Icons.calendar_today_outlined, '31/10/2026')),
          ],
        ),
        const SizedBox(height: 8),

        // Cliente y Ordenar por (con flecha)
        Row(
          children: [
            Expanded(
              child: _filtro(Icons.person_outline, 'Cliente',
                  subtitulo: 'Todos', arrow: true),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _filtro(Icons.swap_vert, 'Ordenar por',
                  subtitulo: 'Más recientes', arrow: true),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Limpiar filtros: mismo color/estilo que compra
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
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
          Icon(icon, size: 17, color: primary),
          const SizedBox(width: 8),
          Expanded(
            child: subtitulo == null
                ? Text(
                    texto,
                    style: const TextStyle(
                      color: primary,
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
                          color: primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitulo,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
          ),
          if (arrow)
            const Icon(Icons.keyboard_arrow_down, size: 16, color: textSecondary),
        ],
      ),
    );
  }
}