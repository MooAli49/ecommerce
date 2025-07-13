import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: Routes.home,
          );
        },
      ),
    );
  }
}
