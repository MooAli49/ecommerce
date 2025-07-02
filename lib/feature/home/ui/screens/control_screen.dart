import '../../../../core/di/di.dart';
import '../../../cart/cart_screen.dart';
import '../../../cart/cubit/cart_cubit.dart';
import '../../controller/cubit/categories_cubit.dart';
import '../../controller/cubit/control_cubit.dart';
import '../../controller/cubit/products_cubit.dart';
import 'home_screen.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../../profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCubit, int>(
      builder: (context, state) {
        final int currentIndex = context.read<ControlCubit>().state;
        final List<Widget> mainScreenBodyWidgets = [
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CategoriesCubit>()..getCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<ProductsCubit>()..getProducts(),
              ),
            ],
            child: HomeScreen(),
          ),
          BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: CartScreen(),
          ),
          BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: ProfileScreen(),
          ),
        ];

        Widget currentScreenBody = mainScreenBodyWidgets[currentIndex];

        return Scaffold(
          body: currentScreenBody,
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
          ),
        );
      },
    );
  }
}
