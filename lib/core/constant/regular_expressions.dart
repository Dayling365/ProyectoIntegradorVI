class CommonRegex {
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{5,20}$');
  static final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
}