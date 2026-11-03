class PurchaseDetailModel {
  final int productId;
  final String productName;
  final int quantity;
  final double purchasePrice;
  final double lineTotal;

  PurchaseDetailModel({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.purchasePrice,
    required this.lineTotal,
  });

  factory PurchaseDetailModel.fromJson(Map<String, dynamic> json) {
    return PurchaseDetailModel(
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      lineTotal: (json['lineTotal'] as num).toDouble(),
     );
  }
}