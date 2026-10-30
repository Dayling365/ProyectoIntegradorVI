import 'package:flutter/material.dart';

import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/users_card.dart';
import 'widgets/users_details.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

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
            style: AppText.heading,
          ),
          const SizedBox(height: 3),
          const Text(
            'Gestiona los usuarios del sistema y sus permisos.',
            style: AppText.bodySecondary,
          ),
          const SizedBox(height: 16),

          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.textMuted, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar por nombre, usuario o correo...',
                      hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
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
            style: AppText.caption,
          ),
          const SizedBox(height: 12),

          
          UsersCard(
            initials: 'AM',
            name: 'Ana Morales',
            email: 'ana.morales@gmail.com',
            roleLabel: 'Administrador',
            roleColor: AppColors.primary,
            roleBgColor: AppColors.primaryLight,
            statusLabel: 'Activo',
            statusColor: AppColors.success,
            statusBgColor: AppColors.successBackground,
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
                  roleColor: AppColors.primary,
                  roleBgColor: AppColors.primaryLight,
                  statusLabel: 'Activo',
                  statusColor: AppColors.success,
                  statusBgColor: AppColors.successBackground,
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
            roleColor: AppColors.warning,
            roleBgColor: AppColors.warningBackground,
            statusLabel: 'Activo',
            statusColor: AppColors.success,
            statusBgColor: AppColors.successBackground,
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
                  roleColor: AppColors.warning,
                  roleBgColor: AppColors.warningBackground,
                  statusLabel: 'Activo',
                  statusColor: AppColors.success,
                  statusBgColor: AppColors.successBackground,
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
            roleColor: AppColors.primary,
            roleBgColor: AppColors.primaryLight,
            statusLabel: 'Inactivo',
            statusColor: AppColors.textSecondary!,
            statusBgColor: AppColors.surfaceMuted,
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
                  roleColor: AppColors.primary,
                  roleBgColor: AppColors.primaryLight,
                  statusLabel: 'Inactivo',
                  statusColor: AppColors.textSecondary!,
                  statusBgColor: AppColors.surfaceMuted,
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
            roleColor: AppColors.warning,
            roleBgColor: AppColors.warningBackground,
            statusLabel: 'Activo',
            statusColor: AppColors.success,
            statusBgColor: AppColors.successBackground,
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
                  roleColor: AppColors.warning,
                  roleBgColor: AppColors.warningBackground,
                  statusLabel: 'Activo',
                  statusColor: AppColors.success,
                  statusBgColor: AppColors.successBackground,
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: AppText.body,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _roleChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: selected ? AppColors.accent : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? AppColors.accent : AppColors.borderLight,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColors.primary : AppColors.textSecondary,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}