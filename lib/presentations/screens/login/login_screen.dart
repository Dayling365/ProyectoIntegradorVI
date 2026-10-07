import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_routes.dart';
import '../../app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Map<String, String> _credenciales = {
    'admin': 'admin123',
    'vendedor': 'vendedor123',
    'carlos': 'carlos123',
  };

  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  String? _userError;
  String? _passError;
  String? _loginError;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final username = _usuarioController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _userError = username.isEmpty ? 'Campo obligatorio' : null;
      _passError = password.isEmpty ? 'Campo obligatorio' : null;
      _loginError = null;
    });

    if (username.isEmpty || password.isEmpty) return;

    final esperada = _credenciales[username.toLowerCase()];

    if (esperada != null && esperada == password) {
      context.read<AppState>().login(username);
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      setState(() => _loginError = 'Credenciales incorrectas');
    }
  }

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
                    controller: _usuarioController,
                    errorText: _userError,
                    highlight: _loginError != null,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) {
                      if (_userError != null || _loginError != null) {
                        setState(() {
                          _userError = null;
                          _loginError = null;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  _campo(
                    icon: Icons.lock_outline,
                    label: "Contraseña",
                    hint: "Ingresa tu contraseña...",
                    circleColor: paleAmber,
                    navy: navy,
                    controller: _passwordController,
                    obscureText: _obscure,
                    errorText: _passError,
                    highlight: _loginError != null,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    onChanged: (_) {
                      if (_passError != null || _loginError != null) {
                        setState(() {
                          _passError = null;
                          _loginError = null;
                        });
                      }
                    },
                    trailing: GestureDetector(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Icon(
                        _obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),

                  if (_loginError != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFFECACA)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 18,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _loginError!,
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: navy,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
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
    TextEditingController? controller,
    bool obscureText = false,
    bool highlight = false,
    Widget? trailing,
    String? errorText,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    TextInputAction? textInputAction,
  }) {
    final hasError = errorText != null || highlight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: hasError ? Colors.redAccent : Colors.grey.shade300,
              width: 1.2,
            ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: navy,
                      ),
                    ),
                    TextField(
                      controller: controller,
                      obscureText: obscureText,
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                      textInputAction: textInputAction,
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 6),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
      ],
    );
  }
}