import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constant/app_routes.dart';
import '../../data/models/user_model.dart';
import '../providers/auth_provider.dart';

const _admin = 'Administrador';
const _vendedor = 'Vendedor';

class _MenuEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  final List<String> allowedRoles;

  const _MenuEntry(
    this.icon,
    this.title,
    this.subtitle,
    this.route,
    this.allowedRoles,
  );
}

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  static const List<_MenuEntry> _items = [
    _MenuEntry(
      Icons.dashboard_outlined,
      'Dashboard',
      'Resumen general',
      AppRoutes.dashboard,
      [_admin, _vendedor],
    ),
    _MenuEntry(
      Icons.shopping_cart_outlined,
      'Historial de compras',
      'Revisa tus compras pasadas',
      AppRoutes.purchasesHistory,
      [_admin],
    ),

    _MenuEntry(
      Icons.sell_outlined,
      'Historial de ventas',
      'Revisa tus ventas pasadas',
      AppRoutes.salesHistory,
      [_admin],
    ),
    _MenuEntry(
      Icons.sell_outlined,
      "Historial de Mis Ventas",
      "Revisa tus ventas pasadas",
      AppRoutes.salesHistory,
      [_vendedor],
    ),

    _MenuEntry(
      Icons.inventory_2_outlined,
      'Inventario',
      'Gestiona tus productos y stock',
      AppRoutes.inventory,
      [_admin, _vendedor],
    ),
    _MenuEntry(
      Icons.swap_vert,
      'Movimientos de inventario',
      'Consulta entradas y salidas ',
      AppRoutes.inventoryMovement,
      [_admin, _vendedor],
    ),

    _MenuEntry(
      Icons.bar_chart_rounded,
      'Reportes',
      'Visualiza y analiza tu información',
      AppRoutes.report,
      [_admin],
    ),

    _MenuEntry(
      Icons.description_outlined,
      'Logs',
      'Historial de actividades',
      AppRoutes.logs,
      [_admin],
    ),

    _MenuEntry(
      Icons.people_outline,
      'Usuarios',
      'Gestiona los usuarios de la app',
      AppRoutes.users,
      [_admin],
    ),

    _MenuEntry(
      Icons.settings_outlined,
      'Preferencias',
      'Configura tu aplicación',
      AppRoutes.preferences,
      [_admin, _vendedor],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.72,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      ),
      child: Column(
        children: [
          _header(user),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _items
                  .where((e) => e.allowedRoles.contains(user?.primaryRole))
                  .map((e) => _tile(context, e, e.route == currentRoute))
                  .toList(),
            ),
          ),
          const Divider(height: 1),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xFFDC2626),
              size: 20,
            ),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Color(0xFFDC2626),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () async {
              final auth = context.read<AuthProvider>();
              final navigator = Navigator.of(context);

              await auth.logout();
              navigator.pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
            }
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _header(UserModel? user) {
  return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 22),
      decoration: const BoxDecoration(
        color: Color(0xFF1B2A5C),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(18)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Color(0xFF1B2A5C), size: 26),
          ),
          const SizedBox(width: 12),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user?.userName ??'',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  user?.primaryRole ?? '',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, _MenuEntry item, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFEEF2FB) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: selected
            ? const Border(left: BorderSide(color: Color(0xFF1B2A5C), width: 4))
            : null,
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: selected ? Colors.white : const Color(0xFFF1F4F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item.icon,
            size: 19,
            color: selected ? const Color(0xFF1B2A5C) : const Color(0xFF8A94A6),
          ),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: selected ? const Color(0xFF1B2A5C) : const Color(0xFF1A1F36),
          ),
        ),
        subtitle: Text(
          item.subtitle,
          style: const TextStyle(fontSize: 11, color: Color(0xFF8A94A6)),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 18,
          color: Color(0xFF8A94A6),
        ),
        onTap: () {
          Navigator.of(context).pop();
          if (selected) return;
          Navigator.of(context).pushReplacementNamed(item.route);
        },
      ),
    );
  }
}
