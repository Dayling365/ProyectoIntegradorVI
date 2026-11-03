class SaleDetailModel {
  final int productId;
  final String productName;
  final String? colorName;
  final String? presentationName;
  final int quantity;
  final double salePrice;
  final double lineTotal;


  const SaleDetailModel({
    required this.productId,
    required this.productName,
    required this.colorName,
    required this.presentationName,
    required this.quantity,
    required this.salePrice,
    required this.lineTotal,
  });


  factory SaleDetailModel.fromJson(Map<String, dynamic> json){
    return SaleDetailModel(
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      colorName: json['colorName'] as String?,
      presentationName: json['presentationName'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      salePrice: (json['salePrice'] as num).toDouble(),
      lineTotal: (json['lineTotal'] as num).toDouble(),
    );
  }
}

