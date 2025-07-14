import 'dart:async';

import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/feature/cart/data/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  // Singleton instance
  static final CartDatabaseHelper _instance = CartDatabaseHelper._internal();

  // Private constructor
  CartDatabaseHelper._internal();

  // Factory constructor to return the singleton instance
  factory CartDatabaseHelper() {
    return _instance;
  }

  static late Database _database;

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  // Initialize the database connection here
  Future<Database> _initDatabase() async {
    // Database initialization logic
    String path = join(await getDatabasesPath(), 'cart_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
  }

  FutureOr<void> _onCreateDatabase(db, version) async {
    // Create tables here
    await db.execute('''
          CREATE TABLE $cartProductTable (
          $cartProductName TEXT NOT NULL,
          $cartProductImage TEXT NOT NULL,
          $cartProductPrice REAL NOT NULL,
          $cartProductQuantity INTEGER NOT NULL
        )
      ''');
  }

  Future<void> insertCartProduct(CartProductModel product) async {
    final db = await database;
    await db.insert(
      cartProductTable,
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
