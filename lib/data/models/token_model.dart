class TokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime accessTokenExpiresAt;
  final DateTime refreshTokenExpiresAt;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiresAt,
    required this.refreshTokenExpiresAt,
  });

  static TokenModel fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      accessTokenExpiresAt: DateTime.parse(json['accessTokenExpiresAt']),
      refreshTokenExpiresAt: DateTime.parse(json['refreshTokenExpiresAt']),
    );
  }
}