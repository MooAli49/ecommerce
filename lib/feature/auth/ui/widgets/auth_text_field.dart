import '../../../../core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.onObscureChanged,
    this.icon,
    this.controller,
  });

  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscure;
  final VoidCallback? onObscureChanged;
  final Widget? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon:
            keyboardType == TextInputType.visiblePassword
                ? GestureDetector(
                  onTap: onObscureChanged,
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
                : icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(color: ColorsManger.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
