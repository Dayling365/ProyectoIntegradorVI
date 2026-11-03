import 'package:get_it/get_it.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/repositories/alert_repository.dart';
import 'package:sistema_libreria_app/data/repositories/auth_repository.dart';
import 'package:sistema_libreria_app/data/repositories/inventory_movement_repository.dart';
import 'package:sistema_libreria_app/data/repositories/inventory_repository.dart';
import 'package:sistema_libreria_app/data/repositories/logs_repository.dart';
import 'package:sistema_libreria_app/data/repositories/product_repository.dart';
import 'package:sistema_libreria_app/data/repositories/purchase_repository.dart';
import 'package:sistema_libreria_app/data/repositories/sale_repository.dart';
import 'package:sistema_libreria_app/data/repositories/token_repository.dart';
import 'package:sistema_libreria_app/data/repositories/user_repository.dart';
import 'package:sistema_libreria_app/presentations/providers/alert_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/auth_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/dashboard_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/inventory_movement_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/inventory_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/logs_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/purchase_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/sale_provider.dart';
import 'package:sistema_libreria_app/presentations/providers/user_provider.dart';
import 'package:sistema_libreria_app/services/alert_service.dart';
import 'package:sistema_libreria_app/services/auth_service.dart';
import 'package:sistema_libreria_app/services/inventory_movement_service.dart';
import 'package:sistema_libreria_app/services/inventory_service.dart';
import 'package:sistema_libreria_app/services/logs_service.dart';
import 'package:sistema_libreria_app/services/purchase_service.dart';
import 'package:sistema_libreria_app/services/sale_service.dart';
import 'package:sistema_libreria_app/services/supplier_service.dart';
import 'package:sistema_libreria_app/services/user_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(getIt<TokenRepository>()),
    dispose: (client) => client.dispose(),
  );

  getIt.registerLazySingleton<TokenRepository>(() => TokenRepository());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<InventoryRepository>(() => InventoryRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<AlertRepository>(() => AlertRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<PurchaseRepository>(() => PurchaseRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<InventoryMovementRepository>(
    () => InventoryMovementRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<LogsRepository>(() => LogsRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<SaleRepository>(() => SaleRepository(getIt<ApiClient>()));

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<AuthRepository>(), getIt<TokenRepository>()),
  );
  getIt.registerLazySingleton<UserService>(
    () => UserService(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<InventoryService>(
    () => InventoryService(getIt<InventoryRepository>(), getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<AlertService>(
    () => AlertService(getIt<AlertRepository>(), getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<PurchaseService>(
    () => PurchaseService(getIt<PurchaseRepository>()),
  );
  getIt.registerLazySingleton<SupplierService>(
    () => SupplierService(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<InventoryMovementService>(
    () => InventoryMovementService(getIt<InventoryMovementRepository>()),
  );
  getIt.registerLazySingleton<LogsService>(
    () => LogsService(getIt<LogsRepository>()),
  );
  getIt.registerLazySingleton<SaleService>(
    () => SaleService(getIt<SaleRepository>()),
  );

  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider(getIt<AuthService>()));
  getIt.registerLazySingleton<UserProvider>(() => UserProvider(getIt<UserService>()));
  getIt.registerLazySingleton<InventoryProvider>(() => InventoryProvider(getIt<InventoryService>()));
  getIt.registerLazySingleton<AlertProvider>(() => AlertProvider(getIt<AlertService>()));
  getIt.registerLazySingleton<DashboardProvider>(
    () => DashboardProvider(getIt<PurchaseService>(), getIt<SaleService>(), getIt<InventoryService>()),
  );
  getIt.registerLazySingleton<PurchaseProvider>(
    () => PurchaseProvider(getIt<PurchaseService>(), getIt<SupplierService>()),
  );
  getIt.registerLazySingleton<InventoryMovementProvider>(
    () => InventoryMovementProvider(getIt<InventoryMovementService>()),
  );
  getIt.registerLazySingleton<LogsProvider>(() => LogsProvider(getIt<LogsService>()));
  getIt.registerLazySingleton<SaleProvider>(() => SaleProvider(getIt<SaleService>()));
}
