import 'package:flutter/material.dart';

class PurchasePagination extends StatelessWidget {
  final int paginaActual;
  final int totalPaginas;

  const PurchasePagination({
    super.key,
    required this.paginaActual,
    required this.totalPaginas,
  });

  @override
  Widget build(BuildContext context) {
    const Color textSecondary = Color(0xFF8A94A6);

    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_left, size: 20),
            ),

            _paginaBoton('1', activa: true),

            const SizedBox(width: 6),

            _paginaBoton('2', activa: false),

            const SizedBox(width: 6),

            _paginaBoton('3', activa: false),

            const SizedBox(width: 6),

            const Text('...', style: TextStyle(color: textSecondary)),

            const SizedBox(width: 6),

            _paginaBoton('40', activa: false),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right, size: 20),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          'Página $paginaActual de $totalPaginas',
          style: const TextStyle(fontSize: 12, color: textSecondary),
        ),
      ],
    );
  }

  Widget _paginaBoton(String texto, {required bool activa}) {
    const Color primary = Color(0xFF1B2A5C);
    const Color textPrimary = Color(0xFF1A1F36);

    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: activa ? primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: activa ? Colors.white : textPrimary,
        ),
      ),
    );
  }
}