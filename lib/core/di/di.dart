import 'package:ecommerce/feature/auth/controller/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  //! auth
  getIt.registerFactory<AuthCubit>(() => AuthCubit());

  //! Home
  // getIt.registerLazySingleton<HomeApiService>(
  //   () => HomeApiService(dio),
  // );
  // getIt.registerLazySingleton<HomeRepo>(
  //   () => HomeRepo(getIt<HomeApiService>()),
  // );
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
