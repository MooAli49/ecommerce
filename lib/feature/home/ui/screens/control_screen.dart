import 'package:ecommerce/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/control_cubit.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ControlCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCubit, int>(
      builder: (context, state) {
        Widget currentScreenBody =
            context.read<ControlCubit>().currentScreenBody;

        return Scaffold(
          body: currentScreenBody,
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: context.read<ControlCubit>().state,
            onTab: (index) async {
              if (index == 2) {
                await context.read<ControlCubit>().getUserData();
              }
              context.read<ControlCubit>().changeScreenIndex(index);
            },
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
