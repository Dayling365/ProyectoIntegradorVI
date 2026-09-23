import 'package:flutter/material.dart';

import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/user_card.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.users,
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          // Encabezado
          const Text(
            'Usuarios',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16233F),
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Gestiona los usuarios del sistema y sus permisos.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 16),

          // Barra de búsqueda
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[400], size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar por nombre, usuario o correo...',
                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Dropdowns: Estado / Ordenar por
          Row(
            children: [
              Expanded(child: _dropdownChip('Estado', Icons.toggle_off_outlined)),
              const SizedBox(width: 10),
              Expanded(child: _dropdownChip('Ordenar por', Icons.calendar_today_outlined)),
            ],
          ),
          const SizedBox(height: 12),

          // Pastillas de filtro por rol (deslizable horizontal para evitar overflow)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _roleChip('Todos', selected: true),
                const SizedBox(width: 8),
                _roleChip('Administrador', selected: false),
                const SizedBox(width: 8),
                _roleChip('Vendedor', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Contador
          const Text(
            '4 usuarios',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),

          // Lista de usuarios
          UserCard(
            initials: 'AM',
            name: 'Ana Morales',
            email: 'ana.morales@gmail.com',
            roleLabel: 'Administrador',
            roleColor: const Color(0xFF3B82F6),
            roleBgColor: const Color(0xFFDCEEFB),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
          ),
          const SizedBox(height: 10),
          UserCard(
            initials: 'CR',
            name: 'Carlos Rojas',
            email: 'crojas@gmail.com',
            roleLabel: 'Vendedor',
            roleColor: const Color(0xFFF59E0B),
            roleBgColor: const Color(0xFFFEF3C7),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
          ),
          const SizedBox(height: 10),
          UserCard(
            initials: 'MV',
            name: 'Miguel Vargas',
            email: 'mvargas@gmail.com',
            roleLabel: 'Administrador',
            roleColor: const Color(0xFF3B82F6),
            roleBgColor: const Color(0xFFDCEEFB),
            statusLabel: 'Inactivo',
            statusColor: Colors.grey[600]!,
            statusBgColor: const Color(0xFFF0F0F0),
          ),
          const SizedBox(height: 10),
          UserCard(
            initials: 'LG',
            name: 'Laura Gómez',
            email: 'lgomez@gmail.com',
            roleLabel: 'Vendedor',
            roleColor: const Color(0xFFF59E0B),
            roleBgColor: const Color(0xFFFEF3C7),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
          ),
        ],
      ),
    );
  }

  Widget _dropdownChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey[600]),
        ],
      ),
    );
  }

  Widget _roleChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF16233F) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? const Color(0xFF16233F) : const Color(0xFFE0E0E0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey[700],
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}