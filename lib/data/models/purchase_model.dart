import 'purchase_detail_model.dart';

class PurchaseModel {
  final int id;
  final int supplierId;
  final String? supplierName;
  final DateTime purchaseDate;
  final double totalAmount;
  final List<PurchaseDetailModel> details;

  PurchaseModel({
    required this.id,
    required this.supplierId,
    required this.supplierName,
    required this.purchaseDate,
    required this.totalAmount,
    required this.details,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    final parsedDetails = json['details'] as List<dynamic>? ?? [];

    return PurchaseModel(
      id: json['id'] as int,
      supplierId: json['supplierId'] as int,
      supplierName: json['supplierName'] as String?,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      details: parsedDetails
      .map((item) => PurchaseDetailModel.fromJson(item as Map<String, dynamic>),)
      .toList(

      )
    );
  }
}