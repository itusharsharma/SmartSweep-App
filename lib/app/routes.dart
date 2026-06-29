import 'package:flutter/material.dart';

import '../features/screens/presentation/splash/splash_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';

  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
  };
}