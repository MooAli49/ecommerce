import 'package:ecommerce/core/helper/shared_pref_helper.dart';
import 'package:ecommerce/feature/auth/data/models/user_model.dart';
import 'package:ecommerce/feature/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce/feature/home/ui/screens/home_screen.dart';
import 'package:ecommerce/feature/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlCubit extends Cubit<int> {
  ControlCubit() : super(0) {
    initialize();
  }

  late UserModel user;

  Future<void> initialize() async {
    await getUserData();
    emit(state); // Refresh UI if needed
  }

  Future<void> getUserData() async {
    final sharedPrefUser = await SharedPrefHelper.getUser();
    if (sharedPrefUser == null) {
      debugPrint(
        'ControlCubit: No user found in SharedPreferences, using guest user.',
      );
      user = UserModel(
        id: '',
        name: 'Guest',
        email: 'Guest@#asdsafmail.com',
        photoUrl: 'default',
      );
    } else {
      debugPrint(
        'ControlCubit: Loaded user from SharedPreferences: ${sharedPrefUser.toJson()}',
      );
      user = sharedPrefUser;
    }
    emit(state); // Always emit to trigger UI rebuild, even if user is null
  }

  Widget get currentScreenBody {
    switch (state) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CartScreen();
      case 2:
      default:
        return ProfileScreen(user: user);
    }
  }

  void changeScreenIndex(int index) {
    emit(index);
  }
}
