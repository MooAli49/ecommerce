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
    this.controller,
    this.onChanged,
    this.validator,
  });

  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscure;
  final VoidCallback? onObscureChanged;
  final Function(String)? onChanged;
  final Widget? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      onChanged: onChanged,
      validator: validator,
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
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
