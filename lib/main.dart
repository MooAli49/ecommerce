import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'ecommerce_app.dart';
import 'feature/auth/controller/cubit/auth_cubit.dart';
import 'feature/cart/controller/cubit/cart_cubit.dart';
import 'feature/home/controller/cubit/categories_cubit.dart';
import 'feature/home/controller/cubit/control_cubit.dart';
import 'feature/home/controller/cubit/products_cubit.dart';
import 'feature/profile/cubit/profile_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with the default options for the current platform
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<CartCubit>()),
        BlocProvider(create: (_) => getIt<ControlCubit>()),
        BlocProvider(create: (_) => getIt<CategoriesCubit>()),
        BlocProvider(create: (_) => getIt<ProductsCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        // BlocProvider(create: (_) => getIt<CheckoutCubit>()),
      ],
      child: ECommerceApp(appRouter: AppRouter()),
    ),
  );
}
