import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({super.key, required this.onSignUpPressed});
  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            Text(
              'Sign in to continue',
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
          ],
        ),
        TextButton(
          onPressed: onSignUpPressed,
          child: Text(
            'Sign Up',
            style: TextStyle(color: ColorsManger.primaryColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
