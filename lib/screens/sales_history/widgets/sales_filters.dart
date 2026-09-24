import 'package:flutter/material.dart';

class SalesFilters extends StatelessWidget {
  const SalesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF1B2A5C);
    const Color info = Color(0xFF2563EB);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        elevation: 0,
        color: const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Buscador
              SizedBox(
                height: 42,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                    prefixIcon: const Icon(Icons.search, size: 18),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Fechas Desde / Hasta
              Row(
                children: [
                  Expanded(
                    child: _filtro(Icons.calendar_today_outlined, '01/10/2026'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _filtro(Icons.calendar_today_outlined, '31/10/2026'),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Cliente / Ordenar por / Limpiar
              Row(
                children: [
                  Expanded(
                    child: _filtro(Icons.person_outline, 'Cliente', arrow: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _filtro(Icons.swap_vert, 'Ordenar por', arrow: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.close, size: 15, color: info),
                            SizedBox(width: 3),
                            Text(
                              'Limpiar filtros',
                              style: TextStyle(color: info, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filtro(
    IconData icon,
    String text, {
    bool arrow = false,
    Color color = Colors.white,
    Color iconColor = Colors.black87,
    Color textColor = Colors.black87,
  }) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: color == Colors.white ? Colors.grey.shade300 : color,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 15, color: iconColor),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 11, color: textColor)),
          if (arrow) const Icon(Icons.keyboard_arrow_down, size: 14),
        ],
      ),
    );
  }
}