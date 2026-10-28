import 'package:get_it/get_it.dart';
import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/repositories/auth_repository.dart';
import 'package:sistema_libreria_app/data/repositories/token_repository.dart';
import 'package:sistema_libreria_app/presentations/providers/auth_provider.dart';
import 'package:sistema_libreria_app/services/auth_service.dart';

final getIt = GetIt.instance;

void setupDependencies(){
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<TokenRepository>()), dispose: (client) => client.dispose());
  //Register repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<ApiClient>()));
  getIt.registerLazySingleton<TokenRepository>(() => TokenRepository());

  //Register services
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<AuthRepository>(), getIt<TokenRepository>()));


  //Register Prooviders
  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider(getIt<AuthService>()));


}