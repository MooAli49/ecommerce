import 'package:ecommerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme().lightTheme);

  bool get isLight => state.brightness == Brightness.light;

  void toggleTheme() {
    final newIsLight = !isLight;
    emit(newIsLight ? AppTheme().lightTheme : AppTheme().darkTheme);
  }
}
