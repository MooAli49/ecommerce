import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/auth/ui/widgets/custom_button.dart';
import 'package:ecommerce/feature/auth/ui/widgets/custom_text_field.dart';
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
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter Your Email',
          keyboardType: TextInputType.emailAddress,
          icon: const Icon(Icons.email_outlined),
        ),
        verticalSpacing(20),
        CustomTextField(
          labelText: 'Password',
          hintText: 'Enter Your Password',
          isObscure: isObscure,
          keyboardType: TextInputType.visiblePassword,
          onObscureChanged: onObscureChanged,
        ),
        verticalSpacing(10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text('Forget Password?')),
        ),
        verticalSpacing(20),
        CustomButton(
          buttonText: 'Login',
          onPressed: () {
            //TODO: Implement login functionality
          },
        ),
      ],
    );
  }
}
