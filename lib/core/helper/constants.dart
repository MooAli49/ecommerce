import 'package:flutter/material.dart';

// Constants for database table names
const String cartProductTable = 'cartProductsTable';
const String cartProductIdColumn = 'productId';
const String cartProductNameColumn = 'name';
const String cartProductPriceColumn = 'price';
const String cartProductQuantityColumn = 'quantity';
const String cartProductImageColumn = 'image';

  // Constants for SharedPreferences keys
const String userKey = 'user';


dynamic snackBarMessage(BuildContext context, String message, Color? color) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(milliseconds: 700),
    ),
  );
}
