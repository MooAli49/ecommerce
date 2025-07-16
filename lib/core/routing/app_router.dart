import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:ecommerce/feature/home/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/ui/screens/login_screen.dart';
import '../../feature/auth/ui/screens/signup_screen.dart';
import '../../feature/home/ui/screens/control_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const ControlScreen(),
        );

      case Routes.productDetails:
        final product = settings.arguments;
        if (product is ProductModel) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          );
        }
        return null; // or handle error

      default:
        return null;
    }
  }
}
