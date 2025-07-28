import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/extensions.dart';
import '../../../../core/helper/spacing.dart';
import '../../controller/cubit/auth_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/welcome_row.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          snackBarMessage(context, state.message, Colors.red);
        } else if (state is AuthSuccess) {
          snackBarMessage(context, 'Successfully signed up!', Colors.green);
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: signupScreenBody(),
      ),
    );
  }

  SafeArea signupScreenBody() {
    final AuthCubit authController = context.read<AuthCubit>();
    return SafeArea(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
                  child: Column(
                    children: [
                      WelcomeRow(
                        welcomeText: 'Create Account',
                        subtitleText: 'Sign up to get started',
                        buttonText: 'login',
                        onPressed: () {
                          context.pop(); // Go back to login
                        },
                      ),
                      verticalSpacing(20),
                      CustomTextField(
                        controller: authController.nameController,
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        icon: const Icon(Icons.person_outline),
                      ),
                      verticalSpacing(20),
                      CustomTextField(
                        controller: authController.emailController,
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                        keyboardType: TextInputType.emailAddress,
                        icon: const Icon(Icons.email_outlined),
                      ),
                      verticalSpacing(20),
                      CustomTextField(
                        controller: authController.passwordController,
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                        isObscure: isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        onObscureChanged: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      verticalSpacing(20),
                      CustomButton(
                        buttonText: 'Sign Up',
                        onPressed: () async {
                          await context
                              .read<AuthCubit>()
                              .signUpWithEmailAndPassword(
                                name: authController.nameController.text,
                                email:
                                    authController.emailController.text.trim(),
                                password:
                                    authController.passwordController.text
                                        .trim(),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (state is AuthLoading)
                Container(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
