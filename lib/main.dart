import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/routing/app_router.dart';
import 'package:ecommerce/ecommerce_app.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with the default options for the current platform
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();

  runApp(ECommerceApp(appRouter: AppRouter()));
}
