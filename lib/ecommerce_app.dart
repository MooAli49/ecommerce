import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/app_router.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'feature/auth/controller/cubit/auth_cubit.dart';
import 'feature/auth/ui/screens/login_screen.dart';
import 'feature/home/ui/screens/control_screen.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: context.watch<ThemeCubit>().state,
                  home: _buildHomeByAuthState(state),
                  onGenerateRoute: appRouter.generateRoute,
                  // initialRoute is not needed when using home
                );
              },
            ),
      ),
    );
  }

  Widget _buildHomeByAuthState(AuthState state) {
    if (state is AuthSuccess) {
      return const ControlScreen();
    } else {
      return const LoginScreen();
    }
  }
}
