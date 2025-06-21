import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/auth/ui/widgets/custom_button.dart';
import 'package:ecommerce/feature/auth/ui/widgets/email_and_password.dart';
import 'package:ecommerce/feature/auth/ui/widgets/other_login_options.dart';
import 'package:ecommerce/feature/auth/ui/widgets/welcome_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          snackBarMessage(context, state.message, Colors.red);
        } else if (state is AuthSuccess) {
          snackBarMessage(context, 'Successfully signed in!', Colors.green);
          context.pushNamed(Routes.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: loginScreenBody(),
      ),
    );
  }

  SafeArea loginScreenBody() {
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
                        welcomeText: 'Welcome Back',
                        subtitleText: 'Login to your account',
                        buttonText: 'Sign Up',
                        onPressed: () {
                          context.pushNamed(Routes.register);
                        },
                      ),
                      verticalSpacing(20),
                      EmailAndPassword(
                        isObscure: isObscure,
                        onObscureChanged: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      verticalSpacing(20),
                      CustomButton(
                        buttonText: 'Login',
                        onPressed: () async {
                          await context
                              .read<AuthCubit>()
                              .signInWithEmailAndPassword(
                                email:
                                    context
                                        .read<AuthCubit>()
                                        .emailController
                                        .text
                                        .trim(),
                                password:
                                    context
                                        .read<AuthCubit>()
                                        .passwordController
                                        .text
                                        .trim(),
                              );
                        },
                      ),
                      verticalSpacing(20),
                      OtherLoginOptions(),
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
