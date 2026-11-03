import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  String get baseUrl => dotenv.env['BASE_API_URL'] ?? '';
  String get environment => dotenv.env['ENVIRONMENT'] ?? '';

  ApiConstants._privateConstructor();
  static final ApiConstants _instance = ApiConstants._privateConstructor();
  static ApiConstants get instance => _instance;

  static const String users = '/users';
  static const String byname = '/auth/byname';
  static String userById(int id) => '$users/$id';
  static const String login = '/auth/login';
  static const String me = '/auth/me';
  static const String categories = '/categories';
  static const String brands = '/brands';
  static const String products = '/products';
  static String productById(int id) => '$products/$id';
  static const String suppliers = '/suppliers';
  static const String customers = '/customers';
  static const String purchases = '/purchases';
  static const String purchaseDetails = '/purchases/details';
  static const String purchasesByDateRange = '/purchases/bydaterange';
  static const String sales = '/sales';
  static const String salesDetails = '/sales/details';
  static const String salesByDateRange = '/sales/bydaterange';
  static const String inventoryMovements = '/inventorymovements';
  static const String inventory = '/inventories';
  static String inventoryByProductId(int id) => '$inventory/product/$id';
  static const String stockAlerts = '/alerts/stock';
  static const String logs = '/logs';

  static const Duration timeoutDuration = Duration(seconds: 30);
}
