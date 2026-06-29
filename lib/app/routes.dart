import 'package:flutter/material.dart';

import '../features/screens/presentation/splash/splash_screen.dart';

class AppRoutes {
  static const splash = '/';

  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashScreen(),
  };
}