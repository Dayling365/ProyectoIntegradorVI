class ProductModel {
  final int id;
  final int baseProductId;
  final String productName;
  final String? description;
  final int categoryId;
  final String? categoryName;
  final int brandId;
  final String? brandName;
  final int? colorId;
  final String? colorName;
  final int? presentationId;
  final String? presentationName;
  final double salePrice;
  final bool state;

  ProductModel({
    required this.id,
    required this.baseProductId,
    required this.productName,
    this.description,
    required this.categoryId,
    this.categoryName,
    required this.brandId,
    this.brandName,
    this.colorId,
    this.colorName,
    this.presentationId,
    this.presentationName,
    required this.salePrice,
    required this.state,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      baseProductId: json['baseProductId'] as int? ?? 0,
      productName: json['productName'] as String? ?? '',
      description: json['description'] as String?,
      categoryId: json['categoryId'] as int? ?? 0,
      categoryName: json['categoryName'] as String?,
      brandId: json['brandId'] as int? ?? 0,
      brandName: json['brandName'] as String?,
      colorId: json['colorId'] as int?,
      colorName: json['colorName'] as String?,
      presentationId: json['presentationId'] as int?,
      presentationName: json['presentationName'] as String?,
      salePrice: (json['salePrice'] as num? ?? 0).toDouble(),
      state: json['state'] as bool? ?? true,
    );
  }
}
