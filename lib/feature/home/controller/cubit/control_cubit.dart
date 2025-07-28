import 'package:ecommerce/feature/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce/feature/home/ui/screens/home_screen.dart';
import 'package:ecommerce/feature/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlCubit extends Cubit<int> {
  ControlCubit() : super(0);
  Widget get currentScreenBody {
    switch (state) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CartScreen();
      case 2:
      default:
        return ProfileScreen();
    }
  }

  void changeScreenIndex(int index) {
    emit(index);
  }
}
