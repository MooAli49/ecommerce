import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/feature/cart/cart_screen.dart';
import 'package:ecommerce/feature/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/home/controller/cubit/control_cubit.dart';
import 'package:ecommerce/feature/home/controller/cubit/home_cubit.dart';
import 'package:ecommerce/feature/home/ui/screens/home_screen.dart';
import 'package:ecommerce/feature/home/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce/feature/profile/cubit/profile_cubit.dart';
import 'package:ecommerce/feature/profile/profile_screen.dart';
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
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
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
