import 'package:sistema_libreria_app/core/network/api_client.dart';
import 'package:sistema_libreria_app/data/models/supplier_model.dart';
import 'package:sistema_libreria_app/data/repositories/supplier_repository.dart';

class SupplierService {
  final SupplierRepository _supplierRepository;

  SupplierService(ApiClient apiClient)
      : _supplierRepository = SupplierRepository(apiClient);

  Future<List<SupplierModel>> getAllSuppliers() {
    return _supplierRepository.getAll();
  }
}