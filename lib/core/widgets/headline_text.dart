import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
