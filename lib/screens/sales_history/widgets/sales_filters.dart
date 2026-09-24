import 'package:flutter/material.dart';

class SalesFilters extends StatelessWidget {
  const SalesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: _FilterField(icon: Icons.calendar_today_outlined, label: 'Desde', value: '01/10/2026')),
            SizedBox(width: 10),
            Expanded(child: _FilterField(icon: Icons.calendar_today_outlined, label: 'Hasta', value: '31/10/2026')),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: _FilterField(icon: Icons.person_outline, label: 'Cliente', value: 'Todos')),
            SizedBox(width: 10),
            Expanded(child: _FilterField(icon: Icons.swap_vert, label: 'Ordenar por', value: 'Más recientes')),
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.close, size: 14, color: Color(0xFF8A94A6)),
            label: const Text('Limpiar filtros', style: TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
          ),
        ),
      ],
    );
  }
}

class _FilterField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _FilterField({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF1B2A5C)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1A1F36))),
                Text(
                  value,
                  style: const TextStyle(fontSize: 11, color: Color(0xFF8A94A6)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF8A94A6)),
        ],
      ),
    );
  }
}