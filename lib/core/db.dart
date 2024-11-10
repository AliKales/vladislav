// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';

class Db {
  static late Database db;

  static Future<void> init() async {
    db = await openDatabase(
      'my_db.db',
      version: 2,
      onOpen: (db) async {
        for (var element in Tables.values) {
          await db.execute(element.code);
        }

        final tables = await db.query(Tables.RTable.name, limit: 1);

        if (tables.isEmpty) {
          for (var i = 0; i < 12; i++) {
            await db.insert(Tables.RTable.name, {
              'name': 'T$i',
              'order_at': DateTime.now().toIso8601String(),
              'has_customer': 0
            });
          }
        }
      },
    );
  }

  static Future<List<Map<String, Object?>>> get(Tables table) async {
    return await db.query(table.name);
  }

  static Future<void> insert(Tables table, Map<String, dynamic> val) async {
    await db.insert(table.name, val);
  }
}

enum Tables {
  RTable('''
CREATE TABLE IF NOT EXISTS RTable (
  id INTEGER PRIMARY KEY,
  name TEXT,
  order_at TEXT,
  has_customer INTEGER
);
  '''),
  ROrder('''
CREATE TABLE IF NOT EXISTS ROrder (
  id INTEGER PRIMARY KEY,
  order_at TEXT,
  total REAL,
  meals TEXT
);
  ''');

  final String code;

  const Tables(this.code);
}
