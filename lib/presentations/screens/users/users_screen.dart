import 'package:flutter/material.dart';

import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/users_card.dart';
import 'widgets/users_details.dart';

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

          
          Row(
            children: [
              Expanded(child: _dropdownChip('Estado', Icons.toggle_off_outlined)),
              const SizedBox(width: 10),
              Expanded(child: _dropdownChip('Ordenar por', Icons.calendar_today_outlined)),
            ],
          ),
          const SizedBox(height: 12),

          
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

          
          UsersCard(
            initials: 'AM',
            name: 'Ana Morales',
            email: 'ana.morales@gmail.com',
            roleLabel: 'Administrador',
            roleColor: const Color(0xFF3B82F6),
            roleBgColor: const Color(0xFFDCEEFB),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
            onMenuTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (_) => const UsersDetails(
                  initials: 'AM',
                  name: 'Ana Morales',
                  email: 'ana.morales@gmail.com',
                  roleLabel: 'Administrador',
                  roleColor: Color(0xFF3B82F6),
                  roleBgColor: Color(0xFFDCEEFB),
                  statusLabel: 'Activo',
                  statusColor: Color(0xFF16A34A),
                  statusBgColor: Color(0xFFDCFCE7),
                  fechaRegistro: '15 Mar 2023',
                  ultimoAcceso: 'Hace 2 horas',
                ),
              );
            },
          ), 
          const SizedBox(height: 10),
          UsersCard(
            initials: 'CR',
            name: 'Carlos Rojas',
            email: 'crojas@gmail.com',
            roleLabel: 'Vendedor',
            roleColor: const Color(0xFFF59E0B),
            roleBgColor: const Color(0xFFFEF3C7),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
            onMenuTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (_) => const UsersDetails(
                  initials: 'CR',
                  name: 'Carlos Rojas',
                  email: 'crojas@gmail.com',
                  roleLabel: 'Vendedor',
                  roleColor: Color(0xFFF59E0B),
                  roleBgColor: Color(0xFFFEF3C7),
                  statusLabel: 'Activo',
                  statusColor: Color(0xFF16A34A),
                  statusBgColor: Color(0xFFDCFCE7),
                  fechaRegistro: '02 Jun 2023',
                  ultimoAcceso: 'Hace 1 día',
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          UsersCard(
            initials: 'MV',
            name: 'Miguel Vargas',
            email: 'mvargas@gmail.com',
            roleLabel: 'Administrador',
            roleColor: const Color(0xFF3B82F6),
            roleBgColor: const Color(0xFFDCEEFB),
            statusLabel: 'Inactivo',
            statusColor: Colors.grey[600]!,
            statusBgColor: const Color(0xFFF0F0F0),
            onMenuTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (_) => UsersDetails(
                  initials: 'MV',
                  name: 'Miguel Vargas',
                  email: 'mvargas@gmail.com',
                  roleLabel: 'Administrador',
                  roleColor: const Color(0xFF3B82F6),
                  roleBgColor: const Color(0xFFDCEEFB),
                  statusLabel: 'Inactivo',
                  statusColor: Colors.grey[600]!,
                  statusBgColor: const Color(0xFFF0F0F0),
                  fechaRegistro: '20 Ene 2023',
                  ultimoAcceso: 'Hace 3 semanas',
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          UsersCard(
            initials: 'LG',
            name: 'Laura Gómez',
            email: 'lgomez@gmail.com',
            roleLabel: 'Vendedor',
            roleColor: const Color(0xFFF59E0B),
            roleBgColor: const Color(0xFFFEF3C7),
            statusLabel: 'Activo',
            statusColor: const Color(0xFF16A34A),
            statusBgColor: const Color(0xFFDCFCE7),
            onMenuTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ), 
                builder: (_) => const UsersDetails(
                  initials: 'LG',
                  name: 'Laura Gómez',
                  email: 'lgomez@gmail.com',
                  roleLabel: 'Vendedor',
                  roleColor: Color(0xFFF59E0B),
                  roleBgColor: Color(0xFFFEF3C7),
                  statusLabel: 'Activo',
                  statusColor: Color(0xFF16A34A),
                  statusBgColor: Color(0xFFDCFCE7),
                  fechaRegistro: '10 Ago 2023',
                  ultimoAcceso: 'Hace 5 horas',
                ),
              );
            },
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