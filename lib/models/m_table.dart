class MTable {
  int? id;
  String? name;
  DateTime? orderAt;
  int? hasCustomer;

  MTable({
    this.id,
    this.name,
    this.orderAt,
    this.hasCustomer,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'order_at': orderAt?.toIso8601String(),
      'has_customer': hasCustomer,
    };
  }

  factory MTable.fromJson(Map<String, dynamic> json) {
    return MTable(
      id: json['id'] as int?,
      name: json['name'] as String?,
      orderAt: DateTime.tryParse((json['order_at'] as String?) ?? ''),
      hasCustomer: json['has_customer'] as int?,
    );
  }
}
