import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/auth/ui/widgets/auth_text_field.dart';
import 'package:ecommerce/feature/auth/ui/widgets/custom_button.dart';
import 'package:ecommerce/feature/auth/ui/widgets/welcome_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          context.pushNamed(Routes.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
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
                          Navigator.of(context).pop(); // Go back to login
                        },
                      ),
                      verticalSpacing(20),
                      AuthTextField(
                        controller: authController.nameController,
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        icon: const Icon(Icons.person_outline),
                      ),
                      verticalSpacing(20),
                      AuthTextField(
                        controller: authController.emailController,
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                        keyboardType: TextInputType.emailAddress,
                        icon: const Icon(Icons.email_outlined),
                      ),
                      verticalSpacing(20),
                      AuthTextField(
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
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
