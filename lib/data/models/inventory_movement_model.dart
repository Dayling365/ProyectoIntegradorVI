class InventoryMovementModel {
  final int id;
  final DateTime dateTime;
  final int inventoryId;
  final int productId;
  final String? productName;
  final String movementType;
  final int quantity;
  final int stockBefore;
  final int stockAfter;
  final int? purchaseId;
  final int? saleId;
  final String? reason;

  InventoryMovementModel({
    required this.id,
    required this.dateTime,
    required this.inventoryId,
    required this.productId,
    this.productName,
    required this.movementType,
    required this.quantity,
    required this.stockBefore,
    required this.stockAfter,
    this.purchaseId,
    this.saleId,
    this.reason,
  });

  factory InventoryMovementModel.fromJson(Map<String, dynamic> json) {
    return InventoryMovementModel(
      id: json['id'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      inventoryId: json['inventoryId'] as int,
      productId: json['productId'] as int,
      productName: json['productName'] as String?,
      movementType: json['movementType'] as String,
      quantity: json['quantity'] as int,
      stockBefore: json['stockBefore'] as int,
      stockAfter: json['stockAfter'] as int,
      purchaseId: json['purchaseId'] as int?,
      saleId: json['saleId'] as int?,
      reason: json['reason'] as String?,
    );
  }
}