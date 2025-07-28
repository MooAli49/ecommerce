import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerce/feature/checkout/controller/cubit/checkout_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/controller/cubit/auth_cubit.dart';
import '../../feature/cart/controller/cubit/cart_cubit.dart';
import '../../feature/home/controller/cubit/control_cubit.dart';
import '../../feature/home/controller/cubit/products_cubit.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  //! Theme
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  //! auth
  getIt.registerFactory<AuthCubit>(() => AuthCubit());

  //! Control
  getIt.registerFactory<ControlCubit>(() => ControlCubit());

  //! Home
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit());

  //! Cart
  getIt.registerFactory<CartCubit>(() => CartCubit());

  //! checkout
  getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit());
}
