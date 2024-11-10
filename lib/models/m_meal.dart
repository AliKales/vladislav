class Meal {
  final String name;
  final String image;
  final double price;
  final double count;

  const Meal({
    required this.name,
    required this.image,
    required this.price,
    this.count = 1,
  });

  // Convert a Meal instance to a Map<String, dynamic> (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'count': count,
    };
  }

  // Create a Meal instance from a Map<String, dynamic> (JSON)
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num).toDouble(),
      count: (json['count'] as num).toDouble(),
    );
  }
}
