import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_routes.dart';
import '../../../data/models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import 'widgets/users_card.dart';
import 'widgets/users_details.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = context.read<UserProvider>();
      if (userProvider.allUsers.isEmpty) {
        userProvider.fetchUsers();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showUserDetails(BuildContext context, UserModel user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => UsersDetails(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return AppScaffold(
      currentRoute: AppRoutes.users,
      body: RefreshIndicator(
        onRefresh: () => userProvider.fetchUsers(),
        color: AppColors.primary,
        child: ListView(
          padding: const EdgeInsets.all(14),
          physics: const AlwaysScrollableScrollPhysics(),
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

            // Buscador conectado en tiempo real
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.textMuted, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => userProvider.setSearchQuery(value),
                      decoration: InputDecoration(
                        hintText: 'Buscar por nombre, usuario o correo...',
                        hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 18, color: AppColors.textSecondary),
                                onPressed: () {
                                  _searchController.clear();
                                  userProvider.setSearchQuery('');
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Filtros por rol (Administrador y Vendedor)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _roleChip(
                    'Todos',
                    selected: userProvider.selectedRole == 'Todos',
                    onTap: () => userProvider.setSelectedRole('Todos'),
                  ),
                  const SizedBox(width: 8),
                  _roleChip(
                    'Administrador',
                    selected: userProvider.selectedRole == 'Administrador',
                    onTap: () => userProvider.setSelectedRole('Administrador'),
                  ),
                  const SizedBox(width: 8),
                  _roleChip(
                    'Vendedor',
                    selected: userProvider.selectedRole == 'Vendedor',
                    onTap: () => userProvider.setSelectedRole('Vendedor'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Contador de usuarios
            Text(
              '${userProvider.userCount} ${userProvider.userCount == 1 ? 'usuario' : 'usuarios'}',
              style: AppText.caption,
            ),
            const SizedBox(height: 12),

            // Evaluación canónica de ViewStatus (Video 8 y 9)
            _buildContent(context, userProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, UserProvider provider) {
    switch (provider.viewStatus) {
      case ViewStatus.loading:
        return const LoadingView(
          message: 'Cargando directorio de usuarios...',
        );

      case ViewStatus.error:
        return ErrorView(
          message: provider.errorMessage ?? 'Error al conectar con la API',
          onRetry: () => provider.fetchUsers(),
        );

      case ViewStatus.success:
      default:
        if (provider.users.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person_off_outlined, size: 48, color: AppColors.textMuted),
                  const SizedBox(height: 12),
                  const Text('No se encontraron usuarios', style: AppText.title),
                  const SizedBox(height: 4),
                  const Text(
                    'Prueba ajustando los filtros o el término de búsqueda.',
                    style: AppText.bodySecondary,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      provider.resetFilters();
                    },
                    child: const Text('Restablecer filtros'),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final user = provider.users[index];
            return UsersCard(
              user: user,
              onMenuTap: () => _showUserDetails(context, user),
            );
          },
        );
    }
  }

  Widget _roleChip(
    String label, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
      ),
    );
  }
}
