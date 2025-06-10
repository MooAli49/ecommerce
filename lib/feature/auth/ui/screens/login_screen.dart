import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/auth/ui/widgets/welcome_row.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              children: [
                WelcomeRow(
                  onSignUpPressed: () {
                    //TODO: Navigate to sign up screen
                  },
                ),
                verticalSpacing(20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
