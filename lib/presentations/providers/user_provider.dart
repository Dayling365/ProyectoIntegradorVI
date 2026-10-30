import 'package:flutter/foundation.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'package:sistema_libreria_app/data/models/user_model.dart';
import 'package:sistema_libreria_app/services/user_service.dart';

/// Máquina de estados visuales canónica del profesor Danny (Video 8 - Regla 19)
enum ViewStatus { initial, loading, success, error }

class UserProvider extends ChangeNotifier {
  final UserService _userService;

  UserProvider(this._userService);

  List<UserModel> _users = [];
  List<UserModel> _filteredUsers = [];

  ViewStatus _viewStatus = ViewStatus.initial;
  ViewStatus get viewStatus => _viewStatus;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  String _selectedRole = 'Todos';
  String get selectedRole => _selectedRole;

  UserModel? _selectedUser;
  UserModel? get selectedUser => _selectedUser;

  // Getters
  List<UserModel> get users => List.unmodifiable(_filteredUsers);
  List<UserModel> get allUsers => List.unmodifiable(_users);
  int get userCount => _filteredUsers.length;
  bool get hasUsers => _filteredUsers.isNotEmpty;
  bool get isLoading => _viewStatus == ViewStatus.loading;

  /// Consulta asíncrona de usuarios con transiciones formales de estado (Video 8 - Sección 17.5)
  Future<void> fetchUsers({String? query}) async {
    _viewStatus = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _userService.searchUsers(query);
      _applyFilters();
      _viewStatus = ViewStatus.success;
    } on AppException catch (e) {
      _errorMessage = e.message;
      _viewStatus = ViewStatus.error;
    } catch (e) {
      _errorMessage = 'No se pudieron cargar los usuarios: ${e.toString()}';
      _viewStatus = ViewStatus.error;
    } finally {
      notifyListeners();
    }
  }

  // Alias compatible con pantallas
  Future<void> loadUsers({bool silent = false}) => fetchUsers();

  /// Actualiza búsqueda y filtra la lista
  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  /// Filtro por rol (Todos / Administrador / Vendedor)
  void setSelectedRole(String role) {
    if (_selectedRole == role) return;
    _selectedRole = role;
    _applyFilters();
    notifyListeners();
  }

  /// Seleccionar usuario para modal de detalle
  void selectUser(UserModel user) {
    _selectedUser = user;
    notifyListeners();
  }

  void clearSelectedUser() {
    _selectedUser = null;
    notifyListeners();
  }

  void resetFilters() {
    _searchQuery = '';
    _selectedRole = 'Todos';
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredUsers = _userService.filterUsers(
      _users,
      query: _searchQuery,
      selectedRole: _selectedRole,
    );
  }
}
