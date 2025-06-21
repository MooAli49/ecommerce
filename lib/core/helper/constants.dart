import 'package:flutter/material.dart';

dynamic snackBarMessage(BuildContext context, String message, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(milliseconds: 700),
    ),
  );
}
