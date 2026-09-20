import 'package:flutter/material.dart';

class LogsFiltros extends StatelessWidget {
  const LogsFiltros({super.key});

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
          side: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _filtro(
                      Icons.filter_alt_outlined,
                      'Filtrar',
                      color: primary,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      'Fecha',
                      arrow: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _filtro(
                      Icons.person_outline,
                      'Usuario',
                      arrow: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _filtro(
                      Icons.grid_view_outlined,
                      'Módulo',
                      arrow: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _filtro(
                      Icons.toggle_off_outlined,
                      'Estado',
                      arrow: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.close,
                              size: 15,
                              color: info,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              'Limpiar filtros',
                              style: TextStyle(
                                color: info,
                                fontSize: 11,
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
          color: color == Colors.white
              ? Colors.grey.shade300
              : color,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: textColor,
            ),
          ),
          if (arrow)
            const Icon(
              Icons.keyboard_arrow_down,
              size: 14,
            ),
        ],
      ),
    );
  }
}