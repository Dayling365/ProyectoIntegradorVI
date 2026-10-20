import 'package:flutter/material.dart';
import '../../../core/constant/app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/account_card.dart';
import 'widgets/appearance_section.dart';
import '../../theme/app_text_theme.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool _darkMode = false;
  String _textSize = 'Mediano';
  String _language = 'Español (Latinoamérica)';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.preferences,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preferencias',
                style: AppText.heading),
            const SizedBox(height: 4),
            const Text('Configura las opciones y preferencias del sistema.',
                style: AppText.bodySecondary),
            const SizedBox(height: 18),
            const AccountCard(),
            const SizedBox(height: 16),
            AppearanceSection(
              darkMode: _darkMode,
              onDarkModeChanged: (v) => setState(() => _darkMode = v),
              textSize: _textSize,
              onTextSizeChanged: (v) => setState(() => _textSize = v ?? _textSize),
              language: _language,
              onLanguageChanged: (v) => setState(() => _language = v ?? _language),
            ),
          ],
        ),
      ),
    );
  }
}