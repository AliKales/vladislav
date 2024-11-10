import 'dart:convert';

import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:vladislav/core/db.dart';
import 'package:vladislav/pages/table_page/table_page_view.dart';

import '../../models/m_meal.dart';

mixin MixinTablePage on State<TablePageView> {
  MapEntry<String, List<Meal>>? selectedList;

  bool get isSelected => selectedList != null;

  final List<MapEntry<String, List<Meal>>> menuList = [
    const MapEntry(
      'Breakfast',
      [
        Meal(
            name: 'Pancakes',
            image: 'https://picsum.photos/200?random=1',
            price: 5.99),
        Meal(
            name: 'Omelette',
            image: 'https://picsum.photos/200?random=2',
            price: 6.99),
        Meal(
            name: 'French Toast',
            image: 'https://picsum.photos/200?random=3',
            price: 7.49),
        Meal(
            name: 'Bagel with Cream Cheese',
            image: 'https://picsum.photos/200?random=4',
            price: 4.99),
        Meal(
            name: 'Waffles',
            image: 'https://picsum.photos/200?random=5',
            price: 6.49),
        Meal(
            name: 'Breakfast Burrito',
            image: 'https://picsum.photos/200?random=6',
            price: 8.99),
        Meal(
            name: 'Cereal with Milk',
            image: 'https://picsum.photos/200?random=7',
            price: 3.49),
        Meal(
            name: 'Avocado Toast',
            image: 'https://picsum.photos/200?random=8',
            price: 7.99),
        Meal(
            name: 'Egg and Bacon Sandwich',
            image: 'https://picsum.photos/200?random=9',
            price: 5.49),
        Meal(
            name: 'Smoothie Bowl',
            image: 'https://picsum.photos/200?random=10',
            price: 6.99),
      ],
    ),
    const MapEntry(
      'Lunch',
      [
        Meal(
            name: 'Grilled Cheese',
            image: 'https://picsum.photos/200?random=11',
            price: 5.99),
        Meal(
            name: 'Chicken Salad',
            image: 'https://picsum.photos/200?random=12',
            price: 9.49),
        Meal(
            name: 'BLT Sandwich',
            image: 'https://picsum.photos/200?random=13',
            price: 7.99),
        Meal(
            name: 'Veggie Wrap',
            image: 'https://picsum.photos/200?random=14',
            price: 6.49),
        Meal(
            name: 'Club Sandwich',
            image: 'https://picsum.photos/200?random=15',
            price: 8.99),
        Meal(
            name: 'Caesar Salad',
            image: 'https://picsum.photos/200?random=16',
            price: 7.49),
        Meal(
            name: 'Grilled Chicken Sandwich',
            image: 'https://picsum.photos/200?random=17',
            price: 8.49),
        Meal(
            name: 'Beef Tacos',
            image: 'https://picsum.photos/200?random=18',
            price: 6.99),
        Meal(
            name: 'Pasta Primavera',
            image: 'https://picsum.photos/200?random=19',
            price: 10.99),
        Meal(
            name: 'Sushi Rolls',
            image: 'https://picsum.photos/200?random=20',
            price: 12.99),
      ],
    ),
    const MapEntry(
      'Dinner',
      [
        Meal(
            name: 'Spaghetti Bolognese',
            image: 'https://picsum.photos/200?random=21',
            price: 12.99),
        Meal(
            name: 'Grilled Salmon',
            image: 'https://picsum.photos/200?random=22',
            price: 14.99),
        Meal(
            name: 'Ribeye Steak',
            image: 'https://picsum.photos/200?random=23',
            price: 19.99),
        Meal(
            name: 'Chicken Alfredo',
            image: 'https://picsum.photos/200?random=24',
            price: 13.49),
        Meal(
            name: 'Lobster Tail',
            image: 'https://picsum.photos/200?random=25',
            price: 22.99),
        Meal(
            name: 'BBQ Ribs',
            image: 'https://picsum.photos/200?random=26',
            price: 18.99),
        Meal(
            name: 'Vegetable Stir Fry',
            image: 'https://picsum.photos/200?random=27',
            price: 11.49),
        Meal(
            name: 'Beef Wellington',
            image: 'https://picsum.photos/200?random=28',
            price: 25.99),
        Meal(
            name: 'Chicken Parmesan',
            image: 'https://picsum.photos/200?random=29',
            price: 15.49),
        Meal(
            name: 'Vegetarian Lasagna',
            image: 'https://picsum.photos/200?random=30',
            price: 13.99),
      ],
    ),
    const MapEntry(
      'Dessert',
      [
        Meal(
            name: 'Chocolate Cake',
            image: 'https://picsum.photos/200?random=31',
            price: 4.99),
        Meal(
            name: 'Cheesecake',
            image: 'https://picsum.photos/200?random=32',
            price: 5.99),
        Meal(
            name: 'Ice Cream Sundae',
            image: 'https://picsum.photos/200?random=33',
            price: 3.99),
        Meal(
            name: 'Tiramisu',
            image: 'https://picsum.photos/200?random=34',
            price: 6.49),
        Meal(
            name: 'Fruit Tart',
            image: 'https://picsum.photos/200?random=35',
            price: 4.49),
        Meal(
            name: 'Chocolate Mousse',
            image: 'https://picsum.photos/200?random=36',
            price: 5.49),
        Meal(
            name: 'Apple Pie',
            image: 'https://picsum.photos/200?random=37',
            price: 3.99),
        Meal(
            name: 'Brownie',
            image: 'https://picsum.photos/200?random=38',
            price: 2.99),
        Meal(
            name: 'Macarons',
            image: 'https://picsum.photos/200?random=39',
            price: 7.99),
        Meal(
            name: 'Cupcakes',
            image: 'https://picsum.photos/200?random=40',
            price: 3.49),
      ],
    ),
  ];
  List<Meal> selectedMeals = [];

  double calculateTotal() {
    return selectedMeals.fold(0.0, (total, meal) => total + meal.price);
  }

  void selectList(int index) {
    setState(() {
      selectedList = menuList[index];
    });
  }

  void unselect() {
    setState(() {
      selectedList = null;
    });
  }

  void addMeal(Meal meal) {
    setState(() {
      selectedMeals.add(meal);
    });
  }

  Future<void> save() async {
    await Db.insert(Tables.ROrder, {
      'order_at': DateTime.now().toIso8601String(),
      'total': calculateTotal(),
      'meals': jsonEncode(selectedMeals.map((e) => e.toJson()).toList())
    });

    Navigator.pop(context);
    CustomSnackbar.showSuccessSnackBar(context,
        text: 'Success', isSuccess: true);
  }
}
