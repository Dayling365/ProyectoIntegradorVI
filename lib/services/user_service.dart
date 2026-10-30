import 'package:sistema_libreria_app/data/models/user_model.dart';
import 'package:sistema_libreria_app/data/repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<List<UserModel>> searchUsers(String? searchTerm) async {
    final cleanSearch = searchTerm?.trim();
    final Map<String, String>? query = (cleanSearch != null && cleanSearch.isNotEmpty)
        ? {'search': cleanSearch}
        : null;

    return await _userRepository.getAll(query: query);
  }

  Future<UserModel> getUserById(int id) async {
    if (id <= 0) {
      throw ArgumentError('El identificador del usuario debe ser un entero positivo.');
    }
    return await _userRepository.getById(id);
  }

  List<UserModel> filterUsers(
    List<UserModel> users, {
    String query = '',
    String selectedRole = 'Todos',
  }) {
    final cleanQuery = query.trim().toLowerCase();
    final roleFilter = selectedRole.toLowerCase();

    return users.where((user) {
      final matchesQuery = cleanQuery.isEmpty ||
          user.userName.toLowerCase().contains(cleanQuery) ||
          user.email.toLowerCase().contains(cleanQuery) ||
          user.roles.any((r) => r.toLowerCase().contains(cleanQuery));

      if (!matchesQuery) return false;

      if (roleFilter != 'todos' && roleFilter.isNotEmpty) {
        final hasRole = user.roles.any((r) => r.toLowerCase().contains(roleFilter)) ||
            user.primaryRole.toLowerCase().contains(roleFilter);
        if (!hasRole) return false;
      }

      return true;
    }).toList();
  }

  Future<List<UserModel>> fetchUsers({Map<String, String>? params}) =>
      _userRepository.getAll(query: params);
}
