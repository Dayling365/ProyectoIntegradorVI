import 'package:sistema_libreria_app/data/models/inventory_movement_model.dart';
import 'package:sistema_libreria_app/data/repositories/inventory_movement_repository.dart';

class InventoryMovementService {
  final InventoryMovementRepository _movementRepository;

  InventoryMovementService(this._movementRepository);

  Future<List<InventoryMovementModel>> getAllMovements() async {
    return await _movementRepository.getAll();
  }

  Future<InventoryMovementModel> getMovementById (int id) async {
    return await _movementRepository.getById(id);
  }

  Future<List<InventoryMovementModel>> getMovementsByProductId (int productId,) async {
    return await _movementRepository.getMovementsByProductId(productId);
  }

  Future<List<InventoryMovementModel>> getMovementsByDateRange( DateTime startDate, DateTime endDate,) async {
    return await _movementRepository.getMovementsByDateRange(
      startDate,
      endDate,
    );
  }

  Future<List<InventoryMovementModel>> getMovementsByType( String movementType,) async {
    return await _movementRepository.getMovementsByType(movementType);
  }

}