import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';
import '../../controller/cubit/auth_cubit.dart';
import 'custom_text_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({
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
          controller: context.read<AuthCubit>().emailController,
          labelText: 'Email',
          hintText: 'Enter Your Email',
          keyboardType: TextInputType.emailAddress,
          icon: const Icon(Icons.email_outlined),
        ),
        verticalSpacing(20),
        CustomTextField(
          controller: context.read<AuthCubit>().passwordController,
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
      ],
    );
  }
}
