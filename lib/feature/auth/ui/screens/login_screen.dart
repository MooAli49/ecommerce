import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/auth/ui/widgets/login_text_fields.dart';
import 'package:ecommerce/feature/auth/ui/widgets/other_login_options.dart';
import 'package:ecommerce/feature/auth/ui/widgets/welcome_row.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              children: [
                WelcomeRow(
                  onSignUpPressed: () {
                    //TODO: Navigate to sign up screen
                  },
                ),
                verticalSpacing(20),
                LoginTextFields(
                  isObscure: isObscure,
                  onObscureChanged: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                verticalSpacing(20),
                OtherLoginOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
