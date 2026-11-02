class LogModel {
  final String id;
  final String? userName;
  final String? performedBy;
  final String? description;
  final String? entity;
  final String? requestType;
  final String? status;
  final DateTime? timestamp;
  final String? method;
  final String? path;

  const LogModel({
    required this.id,
    this.userName,
    this.performedBy,
    this.description,
    this.entity,
    this.requestType,
    this.status,
    this.timestamp,
    this.method,
    this.path,
  });

  String get displayUser {
    if (performedBy?.trim().isNotEmpty == true) return performedBy!;
    if (userName?.trim().isNotEmpty == true) return userName!;
    return 'Anónimo';
  }

  factory LogModel.fromJson(Map<String, dynamic> json) {
    final request = json['request'] ?? json['Request'];
    final timestampJson = json['timestamp'] ?? json['Timestamp'];

    return LogModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      userName: (json['userName'] ?? json['UserName'])?.toString(),
      performedBy: (json['performedBy'] ?? json['PerformedBy'])?.toString(),
      description: (json['description'] ?? json['Description'])?.toString(),
      entity: (json['entity'] ?? json['Entity'])?.toString(),
      requestType: (json['requestType'] ?? json['RequestType'])?.toString(),
      status: (json['status'] ?? json['Status'])?.toString(),
      timestamp: timestampJson == null
          ? null
          : DateTime.tryParse(timestampJson.toString()),
      method: request is Map
          ? (request['method'] ?? request['Method'])?.toString()
          : null,
      path: request is Map
          ? (request['path'] ?? request['Path'])?.toString()
          : null,
    );
  }
}