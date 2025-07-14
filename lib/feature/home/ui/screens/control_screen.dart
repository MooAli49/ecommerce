import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/screens/cart_screen.dart';
import '../../../profile/profile_screen.dart';
import '../../controller/cubit/control_cubit.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'home_screen.dart';

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
          HomeScreen(),
          CartScreen(),
          ProfileScreen(),
        ];

        Widget currentScreenBody = mainScreenBodyWidgets[currentIndex];

        return Scaffold(
          body: currentScreenBody,
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: Icon(
              context.watch<ThemeCubit>().state.brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        );
      },
    );
  }
}
