import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: screenWidth * 0.8,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
          foregroundColor: WidgetStateProperty.all(
            Theme.of(context).colorScheme.onPrimary,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
