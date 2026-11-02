
class SaleModel {
  final int id;
  final int costumerTypeId;
  final String? costumerTypeName;
  final DateTime saleDate;
  final double totalAmount;

  SaleModel({
    required this.id,
    required this.costumerTypeId,
    required this.costumerTypeName,
    required this.saleDate,
    required this.totalAmount,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json){
    return SaleModel(
      id: json['id'] as int,
      costumerTypeId: json['costumerTypeId'] as int,
      costumerTypeName: json['costumerTypeName'] as String?,
      saleDate: DateTime.parse(json['saleDate'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );
  }

}