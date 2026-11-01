
import 'package:sistema_libreria_app/data/models/purchase_model.dart';
import 'package:sistema_libreria_app/data/repositories/purchase_repository.dart';

class PurchaseService {
  final PurchaseRepository _purchaseRepository;

  PurchaseService(this._purchaseRepository);

  Future<List<PurchaseModel>> getAllPurchases() async {
    return await _purchaseRepository.getAll();
  }

  Future<List<PurchaseModel>> searchPurchases(String? searchTerm) async {
    final cleanSearch = searchTerm?.trim();

    final Map<String, String>? query =
        (cleanSearch != null && cleanSearch.isNotEmpty)
            ? {'search': cleanSearch}
            : null;

    return await _purchaseRepository.getAll(query: query);
  }

  Future<List<PurchaseModel>> getPurchasesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await _purchaseRepository.getPurchasesByDateRange(
      startDate,
      endDate,
    );
  }

  Future<PurchaseModel> getPurchaseDetailsById(int id) async {
    return await _purchaseRepository.getPurchaseDetailsById(id);
  }
}
