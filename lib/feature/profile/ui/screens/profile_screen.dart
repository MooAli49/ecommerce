import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/helper/shared_pref_helper.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: IconButton(
          onPressed: () async {
            // Store context in a local variable before async gap
            final navigatorContext = context;
            // Sign out the user
            await navigatorContext.read<AuthCubit>().signOut();
            await SharedPrefHelper.removeUser();
            // Show a snack bar message
            if (context.mounted) {
              snackBarMessage(
                navigatorContext,
                'Signed out successfully',
                Colors.green,
              );
              // Navigate to the login screen
              navigatorContext.pushAndRemoveUntil(
                Routes.login,
                predicate: (Route<dynamic> route) => false,
              );
            }
          },
          icon: Icon(Icons.exit_to_app, size: 100),
        ),
      ),
    );
  }
}
