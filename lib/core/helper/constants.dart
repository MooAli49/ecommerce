import 'package:flutter/material.dart';

const String cartProductTable = 'cartProducts';
const String cartProductName = 'name';
const String cartProductPrice = 'price';
const String cartProductQuantity = 'quantity';
const String cartProductImage = 'image';

dynamic snackBarMessage(BuildContext context, String message, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(milliseconds: 700),
    ),
  );
}
