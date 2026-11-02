
import 'package:sistema_libreria_app/data/models/sale_model.dart';
import 'package:sistema_libreria_app/data/repositories/sale_repository.dart';

class SaleService {
  final SaleRepository _saleRepository;

  SaleService(this._saleRepository);

  Future<List<SaleModel>> getAllSales() async {
    return await _saleRepository.getAll();
  }


  Future<List<SaleModel>> getSalesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await _saleRepository.getSalesByDateRange(
      startDate,
      endDate,
    );
  }
}
