class SupplierModel {
  final int id;
  final String supplierName;
  final String? email;

  SupplierModel({
    required this.id,
    required this.supplierName,
    this.email,
  });

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json['id'] as int,
      supplierName: json['supplierName'] as String,
      email: json['email'] as String?,
    );
  }
}