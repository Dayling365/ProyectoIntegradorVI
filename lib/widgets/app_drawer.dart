import 'package:flutter/material.dart';
import '../app_routes.dart';

class _MenuEntry{
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;

  const _MenuEntry(this.icon,this.title,this.subtitle,this.route);
}

class AppDrawer extends StatelessWidget{

  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});
  
   static const List<_MenuEntry> _items = [
    _MenuEntry(Icons.dashboard_outlined, 'Dashboard', 'Resumen general',AppRoutes.dashboard),
    _MenuEntry(Icons.bar_chart_rounded, 'Reportes','Visualiza y analiza tu información', AppRoutes.report),
    _MenuEntry(Icons.description_outlined, 'Logs', 'Historial de actividades',AppRoutes.logs),
  ];

 @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.72,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      ),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _items
                  .map((e) => _tile(context, e, e.route == currentRoute))
                  .toList(),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFDC2626), size: 20),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(
                  color: Color(0xFFDC2626),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.login, (_) => false),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
 
  /// Cabecera azul con el avatar y el nombre del usuario.
  Widget _header() {
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
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Don César Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Administrador',
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
            ? const Border(
                left: BorderSide(color: Color(0xFF1B2A5C), width: 4),
              )
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
        trailing: const Icon(Icons.chevron_right,
            size: 18, color: Color(0xFF8A94A6)),
        onTap: () {
          Navigator.of(context).pop(); // 1. cierra el menu
          if (selected) return; // 2. ya estamos ahi, no hacemos nada
          Navigator.of(context).pushReplacementNamed(item.route); 
        },
      ),
    );
  }
}
