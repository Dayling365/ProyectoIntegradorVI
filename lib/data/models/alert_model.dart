import 'product_model.dart';

enum AlertSeverity { critical, warning }

class AlertModel {
  final int productId;
  final String productName;
  final int unitsInStock;
  final int minStock;

  final String? categoryName;

  AlertModel({
    required this.productId,
    required this.productName,
    required this.unitsInStock,
    required this.minStock,
    this.categoryName,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      productId: json['productId'] as int,
      productName: json['productName'] as String? ?? '',
      unitsInStock: json['unitsInStock'] as int? ?? 0,
      minStock: json['minStock'] as int? ?? 0,
    );
  }

  AlertModel withProduct(ProductModel? product) {
    return AlertModel(
      productId: productId,
      productName: productName,
      unitsInStock: unitsInStock,
      minStock: minStock,
      categoryName: product?.categoryName,
    );
  }
}
