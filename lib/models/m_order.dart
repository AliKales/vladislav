import 'dart:convert';

import 'package:caroby/caroby.dart';
import 'package:vladislav/models/m_meal.dart';

class MOrder {
  final int id;
  final DateTime orderAt;
  final double total;
  final List<Meal> meals;

  MOrder({
    required this.id,
    required this.orderAt,
    required this.total,
    required this.meals,
  });

  factory MOrder.fromJson(Map<String, dynamic> json) {
    return MOrder(
      id: json['id'],
      orderAt: (json['order_at'] as String).toDateTime!,
      total: json['total'],
      meals: (jsonDecode(json['meals']) as List<dynamic>)
          .map((e) => Meal.fromJson(e))
          .toList(),
    );
  }
}
