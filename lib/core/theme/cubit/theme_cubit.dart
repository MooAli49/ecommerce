import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/core/helper/shared_pref_helper.dart';
import 'package:ecommerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme().lightTheme) {
    _loadTheme();
  }

  bool get isDark => state.brightness == Brightness.dark;

  void _loadTheme() async {
    bool isDark = await SharedPrefHelper.getBool(isDarkModeKey);
    debugPrint('ThemeCubit : loadTheme isDark: $isDark');
    emit(isDark ? AppTheme().darkTheme : AppTheme().lightTheme);
  }

  void toggleTheme(bool toDark) {
    debugPrint('ThemeCubit : toggleTheme toDark: $toDark');
    SharedPrefHelper.setDarkMode(toDark);
    emit(toDark ? AppTheme().darkTheme : AppTheme().lightTheme);
  }
}
