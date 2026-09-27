import 'package:flutter/material.dart';
import 'setting_switch_tile.dart';
import 'setting_dropdown_tile.dart';

class AppearanceSection extends StatelessWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;
  final String textSize;
  final ValueChanged<String?> onTextSizeChanged;
  final String language;
  final ValueChanged<String?> onLanguageChanged;

  const AppearanceSection({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
    required this.textSize,
    required this.onTextSizeChanged,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.palette_outlined, size: 18, color: Color(0xFF1B2A5C)),
              SizedBox(width: 8),
              Text('Apariencia', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36))),
            ],
          ),
          const SizedBox(height: 16),
          SettingSwitchTile(
            icon: Icons.nightlight_round,
            title: 'Modo oscuro',
            subtitle: 'Cambiar entre tema claro y oscuro',
            value: darkMode,
            onChanged: onDarkModeChanged,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Color(0xFFE2E8F0)),
          ),
          SettingDropdownTile(
            leading: const Text('Aa', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1B2A5C))),
            title: 'Tamaño de texto',
            subtitle: 'Selecciona el tamaño de la letra en la aplicación',
            value: textSize,
            options: const ['Pequeño', 'Mediano', 'Grande'],
            onChanged: onTextSizeChanged,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Color(0xFFE2E8F0)),
          ),
          SettingDropdownTile(
            leading: const Icon(Icons.language, size: 20, color: Color(0xFF1B2A5C)),
            title: 'Idioma',
            subtitle: 'Selecciona el idioma de la aplicación',
            value: language,
            options: const ['Español (Latinoamérica)', 'Español (España)', 'English'],
            onChanged: onLanguageChanged,
          ),
        ],
      ),
    );
  }
}