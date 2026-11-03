
import 'package:sistema_libreria_app/data/models/sale_model.dart';
import 'package:sistema_libreria_app/data/repositories/sale_repository.dart';
import 'package:sistema_libreria_app/data/models/sale_detail_model.dart';
class SaleService {
  final SaleRepository _saleRepository;

  SaleService(this._saleRepository);

  Future<List<SaleModel>> getAllSales() async {
    return await _saleRepository.getAll();
  }
  Future<List<SaleDetailModel>> getSaleDetails(int saleId) {
  return _saleRepository.getSaleDetails(saleId);
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
  Future<SaleModel> getSaleDetailsById(int id) {
  return _saleRepository.getById(id);
}
}
