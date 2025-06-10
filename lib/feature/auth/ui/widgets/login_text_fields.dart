import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
    required this.isObscure,
    required this.onObscureChanged,
  });
  final bool isObscure;
  final void Function()? onObscureChanged;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            suffixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: ColorsManger.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
        verticalSpacing(20),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: isObscure,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your Password',
            suffixIcon: GestureDetector(
              onTap: onObscureChanged,
              child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: ColorsManger.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
        verticalSpacing(10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text('Forget Password?')),
        ),
        verticalSpacing(20),
        SizedBox(
          width: screenWidth * 0.8,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              //TODO: Implement login functionality
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsManger.primaryColor,
              ),
              foregroundColor: WidgetStateProperty.all(
                ColorsManger.backgroundColor,
              ),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
