class UserModel {
  final int id;
  final String userName;
  final String email;
  final List<String> roles;
  final bool isActive;
  final String? createdAt;
  final String? lastLogin;

  const UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.roles,
    this.isActive = true,
    this.createdAt,
    this.lastLogin,
  });

  /// Deserialización del UserDto de C# / .NET
  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedRoles = [];
    if (json['roles'] != null) {
      if (json['roles'] is List) {
        parsedRoles = (json['roles'] as List).map((e) => e.toString()).toList();
      } else if (json['roles'] is String) {
        parsedRoles = [json['roles'] as String];
      }
    }

    return UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userName: (json['userName'] ?? json['username'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      roles: parsedRoles,
      isActive: true,
      createdAt: json['createdAt']?.toString() ?? json['fechaRegistro']?.toString(),
      lastLogin: json['lastLogin']?.toString() ?? json['ultimoAcceso']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'roles': roles,
      'createdAt': createdAt,
      'lastLogin': lastLogin,
    };
  }

  // Getters de compatibilidad con la guía del profesor Danny
  String get username => userName;
  String get fullName => userName;

  /// Rol principal formateado (Administrador o Vendedor)
  String get primaryRole {
    if (roles.isEmpty) return 'Usuario';
    final role = roles.first.toLowerCase();
    if (role.contains('admin')) return 'Administrador';
    if (role.contains('vendedor') || role.contains('seller')) return 'Vendedor';
    return roles.first;
  }

  String get roleName => primaryRole;

  bool get isAdmin => roles.any((r) => r.toLowerCase().contains('admin'));

  /// Iniciales para CircleAvatar (ej. "Admin" -> "AD", "Carlos Rojas" -> "CR")
  String get initials {
    final clean = userName.trim();
    if (clean.isEmpty) return '?';
    final parts = clean.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    if (clean.length >= 2) {
      return clean.substring(0, 2).toUpperCase();
    }
    return clean[0].toUpperCase();
  }

  String get statusLabel => isActive ? 'Activo' : 'Inactivo';
}
