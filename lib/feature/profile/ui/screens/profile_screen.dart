import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/helper/shared_pref_helper.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final UserModel user;
  // String? _userName;
  Future<void> _logout(BuildContext context) async {
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
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().isDark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              verticalSpacing(40),
              Row(
                children: [
                  horizontalSpacing(20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        user.photoUrl == 'default'
                            ? AssetImage('assets/images/person.png')
                            : NetworkImage(user.photoUrl),
                  ),
                  horizontalSpacing(20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpacing(60),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SwitchListTile(
                  title: Text(
                    'Dark Mode',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  value: isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme(value);
                  },
                ),
              ),
              _customListTile(
                context,
                icon: Icons.edit,
                title: 'Edit Profile',
                onTap: () {},
              ),
              verticalSpacing(10),
              _customListTile(
                context,
                icon: Icons.location_on,
                title: 'Shipping Address',
                onTap: () {},
              ),
              verticalSpacing(10),
              _customListTile(
                context,
                icon: Icons.history,
                title: 'Order History',
                onTap: () {},
              ),
              verticalSpacing(10),
              _customListTile(
                context,
                icon: Icons.credit_card,
                title: 'Cards & Payments',
                onTap: () {},
              ),
              verticalSpacing(10),
              _customListTile(
                context,
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
              verticalSpacing(10),
              _customListTile(
                context,
                icon: Icons.logout,
                title: 'Logout',
                onTap: () async => await _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 35, color: Theme.of(context).iconTheme.color),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: onTap,
    );
  }
}
