import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/controller/cubit/auth_cubit.dart';
import '../../feature/cart/controller/cubit/cart_cubit.dart';
import '../../feature/home/controller/cubit/categories_cubit.dart';
import '../../feature/home/controller/cubit/control_cubit.dart';
import '../../feature/home/controller/cubit/products_cubit.dart';
import '../../feature/profile/cubit/profile_cubit.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {

  //! Theme
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  //! auth
  getIt.registerFactory<AuthCubit>(() => AuthCubit());

  //! Control
  getIt.registerFactory<ControlCubit>(() => ControlCubit());

  //! Home
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit());
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit());

  //! Cart
  getIt.registerFactory<CartCubit>(() => CartCubit());

  //! Profile
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  //checkout
  // getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit());
}
