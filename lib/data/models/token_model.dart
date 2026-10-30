class TokenModel {
  final String accessToken;
  //final String refreshToken;
  final DateTime accessTokenExpiresAt;
  //final DateTime refreshTokenExpiresAt;

  TokenModel({ 
    required this.accessToken,
    //required this.refreshToken,
    required this.accessTokenExpiresAt,
    //required this.refreshTokenExpiresAt,
  });

  bool get isAccesTokenExpired => DateTime.now().isAfter(accessTokenExpiresAt);

  static TokenModel fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      //refreshToken: json['refreshToken'],
      accessTokenExpiresAt: DateTime.parse(json['accessTokenExpiresAt']),
      //refreshTokenExpiresAt: DateTime.parse(json['refreshTokenExpiresAt']),
    );
  }
    // Para la respuesta del LOGIN de la API: { id, userName, email, token, roles }
  static TokenModel fromLoginJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['token'] as String,
      // La API crea el token con duración de 3 horas (AddHours(3) en AuthService)
      accessTokenExpiresAt: DateTime.now().add(const Duration(hours: 3)),
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'accessToken':accessToken,
      //'refreshToken':refreshToken,
      'accessTokenExpiresAt':accessTokenExpiresAt.toIso8601String(),
      //'refreshTokenExpiresAt':refreshTokenExpiresAt.toIso8601String(),
    };
  }
}