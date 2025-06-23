import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/home/controller/cubit/control_cubit.dart';
import 'package:ecommerce/feature/home/controller/cubit/home_cubit.dart';
import 'package:ecommerce/feature/profile/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  //! auth
  getIt.registerFactory<AuthCubit>(() => AuthCubit());

  //! Control
  getIt.registerFactory<ControlCubit>(() => ControlCubit());

  //! Home
  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  //! Cart
  getIt.registerFactory<CartCubit>(() => CartCubit());

  //! Profile
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
}
