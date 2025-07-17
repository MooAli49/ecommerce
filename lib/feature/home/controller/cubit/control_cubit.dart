import 'package:ecommerce/feature/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce/feature/home/ui/screens/home_screen.dart';
import 'package:ecommerce/feature/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlCubit extends Cubit<int> {
  ControlCubit() : super(0);
  // int get currentIndex => state;
  final List<Widget> _mainScreenBodyWidgets = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  Widget get currentScreenBody => _mainScreenBodyWidgets[state];
  void initialize() {
    emit(0); // Set initial index to 0 (HomeScreen)
  }

  void changeScreenIndex(int index) {
    emit(index);
  }
}
