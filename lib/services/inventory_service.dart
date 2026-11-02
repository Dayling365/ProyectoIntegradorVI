import 'package:sistema_libreria_app/data/models/inventory_model.dart';
import 'package:sistema_libreria_app/data/models/paged_response_model.dart';
import 'package:sistema_libreria_app/data/models/product_model.dart';
import 'package:sistema_libreria_app/data/repositories/inventory_repository.dart';
import 'package:sistema_libreria_app/data/repositories/product_repository.dart';

class InventoryService {
  final InventoryRepository _inventoryRepository;
  final ProductRepository _productRepository;

  InventoryService(this._inventoryRepository, this._productRepository);

  static const int _downloadPageSize = 100;

  static const String all = 'Todos';
  static const String statusInStock = 'En stock';
  static const String statusLowStock = 'Stock bajo';
  static const String sortByName = 'Nombre (A-Z)';
  static const String sortByPriceAsc = 'Precio (menor a mayor)';
  static const String sortByPriceDesc = 'Precio (mayor a menor)';

  static const List<String> statuses = [all, statusInStock, statusLowStock];
  static const List<String> sortOptions = [sortByName, sortByPriceAsc, sortByPriceDesc];

  /// Descarga todas las páginas de inventario y de productos, y las une por productId.
  Future<List<InventoryModel>> getAllInventory() async {
    final results = await Future.wait([
      PagedResponse.fetchAll<InventoryModel>(
        (page) => _inventoryRepository.getPage(pageNumber: page, pageSize: _downloadPageSize),
      ),
      PagedResponse.fetchAll<ProductModel>(
        (page) => _productRepository.getPage(pageNumber: page, pageSize: _downloadPageSize),
      ),
    ]);

    final inventory = results[0] as List<InventoryModel>;
    final products = results[1] as List<ProductModel>;
    final productsById = {for (final p in products) p.id: p};

    return inventory.map((item) => item.withProduct(productsById[item.productId])).toList();
  }

  /// Trae el producto y su inventario al mismo tiempo, y los une.
  Future<InventoryModel> getProductDetail(int productId) async {
    if (productId <= 0) {
      throw ArgumentError('El identificador del producto debe ser mayor a 0.');
    }

    final results = await Future.wait([
      _inventoryRepository.getByProductId(productId),
      _productRepository.getById(productId),
    ]);

    final inventory = results[0] as InventoryModel;
    final product = results[1] as ProductModel;
    return inventory.withProduct(product);
  }

  String availabilityLevel(InventoryModel item) {
    if (item.isLowStock) return 'Bajo';
    if (item.unitsInStock <= item.minStock * 2) return 'Medio';
    return 'Óptimo';
  }

  List<String> categoriesOf(List<InventoryModel> items) =>
      _optionsOf(items.map((i) => i.categoryName));

  List<String> brandsOf(List<InventoryModel> items) =>
      _optionsOf(items.map((i) => i.brandName));

  List<String> _optionsOf(Iterable<String?> values) {
    final options = values
        .whereType<String>()
        .where((v) => v.trim().isNotEmpty)
        .toSet()
        .toList()
      ..sort();
    return [all, ...options];
  }

  List<InventoryModel> filter(
    List<InventoryModel> items, {
    String query = '',
    String category = all,
    String brand = all,
    String status = all,
    String sortBy = sortByName,
  }) {
    final q = query.trim().toLowerCase();

    final result = items.where((item) {
      final matchesQuery = q.isEmpty ||
          item.productName.toLowerCase().contains(q) ||
          (item.brandName ?? '').toLowerCase().contains(q) ||
          (item.description ?? '').toLowerCase().contains(q) ||
          item.variantLabel.toLowerCase().contains(q);
      final matchesCategory = category == all || item.categoryName == category;
      final matchesBrand = brand == all || item.brandName == brand;
      final matchesStatus = switch (status) {
        statusInStock => !item.isLowStock,
        statusLowStock => item.isLowStock,
        _ => true,
      };
      return matchesQuery && matchesCategory && matchesBrand && matchesStatus;
    }).toList();

    switch (sortBy) {
      case sortByPriceAsc:
        result.sort((a, b) => a.salePrice.compareTo(b.salePrice));
        break;
      case sortByPriceDesc:
        result.sort((a, b) => b.salePrice.compareTo(a.salePrice));
        break;
      case sortByName:
      default:
        result.sort((a, b) => a.productName.toLowerCase().compareTo(b.productName.toLowerCase()));
    }

    return result;
  }

  /// Corta la lista ya filtrada en la página pedida. Si la página no existe, usa la más cercana.
  PagedResponse<InventoryModel> paginate(
    List<InventoryModel> items, {
    required int pageNumber,
    required int pageSize,
  }) {
    if (pageSize <= 0) {
      throw ArgumentError('El tamaño de página debe ser mayor a 0.');
    }
    if (items.isEmpty) return PagedResponse.empty();

    final totalPages = (items.length / pageSize).ceil();
    final safePage = pageNumber.clamp(1, totalPages);

    return PagedResponse(
      items: items.skip((safePage - 1) * pageSize).take(pageSize).toList(),
      totalRecords: items.length,
      totalPages: totalPages,
      pageNumber: safePage,
      pageSize: pageSize,
    );
  }
}
