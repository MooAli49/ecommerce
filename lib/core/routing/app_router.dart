import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:ecommerce/feature/home/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/auth/controller/cubit/auth_cubit.dart';
import '../../feature/auth/ui/screens/login_screen.dart';
import '../../feature/auth/ui/screens/signup_screen.dart';
import '../../feature/home/controller/cubit/control_cubit.dart';
import '../../feature/home/ui/screens/control_screen.dart';
import '../di/di.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //  this args is used to pass data between screens like this arguments: arguyment as className
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: const SignupScreen(),
              ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ControlCubit>(),
                child: const ControlScreen(),
              ),
        );

      case Routes.productDetails:
        final product = settings.arguments;
        if (product is ProductModel) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: getIt<ControlCubit>(),
                  child: ProductDetailScreen(product: product),
                ),
          );
        }
        return null; // or handle error

      default:
        return null;
    }
  }
}
