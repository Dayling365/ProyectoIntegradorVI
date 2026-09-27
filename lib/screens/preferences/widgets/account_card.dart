import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_state.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final roleLabel = appState.isAdmin ? 'Administrador Principal' : 'Vendedor';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF1B2A5C).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person_outline, color: Color(0xFF1B2A5C), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mi cuenta', style: TextStyle(fontSize: 11, color: Color(0xFF8A94A6))),
                const SizedBox(height: 2),
                Text(appState.userName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A1F36))),
                const SizedBox(height: 2),
                Text(roleLabel, style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}