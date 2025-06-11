
import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.onObscureChanged,
    this.icon,
  });

  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscure;
  final VoidCallback? onObscureChanged;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: keyboardType == TextInputType.visiblePassword
            ? GestureDetector(
                onTap: onObscureChanged,
                child: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: ColorsManger.primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}