import 'package:flutter/material.dart';

import '../features/screens/presentation/splash/splash_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/scanner/presentation/scan_screen.dart';
import '../features/scanner/presentation/scan_results_screen.dart';
import '../features/cleaner/presentation/cleaning_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const dashboard = '/dashboard';
  static const scan = '/scan';
  static const scanResults = '/scan-results';
  static const cleaning = '/cleaning';

  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
    dashboard: (_) => const DashboardScreen(),
    scan: (_) => const ScanScreen(),
    scanResults: (_) => const ScanResultsScreen(),
    cleaning: (_) => const CleaningScreen(),
  };
}