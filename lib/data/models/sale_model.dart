import 'sale_detail_model.dart';

class SaleModel {
  final int id;
  final int costumerTypeId;
  final String? costumerTypeName;
  final DateTime saleDate;
  final double totalAmount;
  final List<SaleDetailModel> details;

  SaleModel({
    required this.id,
    required this.costumerTypeId,
    required this.costumerTypeName,
    required this.saleDate,
    required this.totalAmount,
    this.details = const [],
  });

  factory SaleModel.fromJson(Map<String, dynamic> json){
    final rawDetails = json['details'] ?? json['Details'];
    return SaleModel(
      id: json['id'] as int,
      costumerTypeId: int.tryParse(
        (json['costumerTypeId'] ??
                json['customerTypeId'] ??
                json['CostumerTypeId'] ??
                json['CustomerTypeId'] ??
                '0')
            .toString(),
      ) ?? 0,
      costumerTypeName: json['customerTypeName'] as String?,
      saleDate: DateTime.parse(json['saleDate'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      details: rawDetails is List
          ? rawDetails
            .whereType<Map<String, dynamic>>()
            .map(SaleDetailModel.fromJson)
            .toList()
          : const [],
    );
  }

}