import 'package:flutter/material.dart';
import '../../app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF1B2A5C);
    const amber = Color(0xFFF5A623);
    const paleAmber = Color(0xFFFCEAC5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/header_bg.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 130),

                  const Icon(Icons.menu_book_rounded, size: 64, color: navy),
                  const SizedBox(height: 12),

                  const Text(
                    "Librería Don César",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(height: 3, width: 60, color: amber),
                  const SizedBox(height: 24),

                  const Text(
                    "¡Bienvenido!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Inicia sesión para acceder a tu cuenta de la librería.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 32),

                  _campo(
                    icon: Icons.person_outline,
                    label: "Usuario",
                    hint: "Ingresa tu nombre de usuario...",
                    circleColor: paleAmber,
                    navy: navy,
                  ),
                  const SizedBox(height: 16),
                  _campo(
                    icon: Icons.lock_outline,
                    label: "Contraseña",
                    hint: "Ingresa tu contraseña...",
                    circleColor: paleAmber,
                    navy: navy,
                    obscureText: true,
                    trailingIcon: Icons.visibility_outlined,
                  ),
                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.dashboard),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: navy,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _campo({
    required IconData icon,
    required String label,
    required String hint,
    required Color circleColor,
    required Color navy,
    bool obscureText = false,
    IconData? trailingIcon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: circleColor,
            radius: 17,
            child: Icon(icon, color: navy, size: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: navy),
                ),
                TextField(
                  obscureText: obscureText,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          if (trailingIcon != null) Icon(trailingIcon, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}