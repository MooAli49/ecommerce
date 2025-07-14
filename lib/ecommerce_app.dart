import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/cubit/theme_cubit.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeCubit>().state,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
