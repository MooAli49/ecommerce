import 'package:ecommerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme().lightTheme);

  bool get isDark => state.brightness == Brightness.dark;

  void toggleTheme(bool toDark) {
    emit(toDark ? AppTheme().darkTheme : AppTheme().lightTheme);
  }
}
