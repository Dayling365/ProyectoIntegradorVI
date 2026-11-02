import 'product_model.dart';

class InventoryModel {
  final int id;
  final int productId;
  final String productName;
  final String? colorName;
  final String? presentationName;
  final double salePrice;
  final int unitsInStock;
  final int minStock;
  final bool isLowStock;
  final String? stockStatus;
  final int? unitsMissing;

  // No vienen en /api/Inventories: se completan desde /api/Products (ver withProduct).
  final String? categoryName;
  final String? brandName;
  final String? description;

  InventoryModel({
    required this.id,
    required this.productId,
    required this.productName,
    this.colorName,
    this.presentationName,
    required this.salePrice,
    required this.unitsInStock,
    required this.minStock,
    required this.isLowStock,
    this.stockStatus,
    this.unitsMissing,
    this.categoryName,
    this.brandName,
    this.description,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json['id'] as int,
      productId: json['productId'] as int,
      productName: json['productName'] as String? ?? '',
      colorName: json['colorName'] as String?,
      presentationName: json['presentationName'] as String?,
      salePrice: (json['salePrice'] as num? ?? 0).toDouble(),
      unitsInStock: json['unitsInStock'] as int? ?? 0,
      minStock: json['minStock'] as int? ?? 0,
      isLowStock: json['isLowStock'] as bool? ?? false,
      stockStatus: json['stockStatus'] as String?,
      unitsMissing: json['unitsMissing'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'productName': productName,
        'colorName': colorName,
        'presentationName': presentationName,
        'salePrice': salePrice,
        'unitsInStock': unitsInStock,
        'minStock': minStock,
        'isLowStock': isLowStock,
        'stockStatus': stockStatus,
        if (unitsMissing != null) 'unitsMissing': unitsMissing,
      };

  InventoryModel withProduct(ProductModel? product) {
    return InventoryModel(
      id: id,
      productId: productId,
      productName: productName,
      colorName: colorName,
      presentationName: presentationName,
      salePrice: salePrice,
      unitsInStock: unitsInStock,
      minStock: minStock,
      isLowStock: isLowStock,
      stockStatus: stockStatus,
      unitsMissing: unitsMissing,
      categoryName: product?.categoryName,
      brandName: product?.brandName,
      description: product?.description,
    );
  }

  String get variantLabel => [colorName, presentationName]
      .whereType<String>()
      .where((value) => value.trim().isNotEmpty)
      .join(' • ');
}
