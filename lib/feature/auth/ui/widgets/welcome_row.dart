// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({
    super.key,
    required this.onPressed,
    required this.welcomeText,
    required this.subtitleText,
    required this.buttonText,
  });
  final VoidCallback onPressed;
  final String welcomeText;
  final String subtitleText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              welcomeText,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            Text(
              subtitleText,
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
          ],
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: ColorsManger.primaryColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
