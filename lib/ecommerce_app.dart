import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors_manger.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorsManger.lightScheme,
        scaffoldBackgroundColor: ColorsManger.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsManger.primaryColor,
          foregroundColor: ColorsManger.onPrimary,
          elevation: 0,
          iconTheme: const IconThemeData(color: ColorsManger.onPrimary),
          titleTextStyle: const TextStyle(
            color: ColorsManger.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManger.primaryColor,
            foregroundColor: ColorsManger.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: ColorsManger.secondaryColor.withOpacity(0.1),
          labelStyle: const TextStyle(color: ColorsManger.onSecondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsManger.surfaceColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
