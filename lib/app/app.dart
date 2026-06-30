import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class SmartSweepApp extends StatefulWidget {
  const SmartSweepApp({super.key});

  static _SmartSweepAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SmartSweepAppState>();
  }

  @override
  State<SmartSweepApp> createState() => _SmartSweepAppState();
}

class _SmartSweepAppState extends State<SmartSweepApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme(bool darkMode) {
    setState(() {
      _themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  bool get isDark => _themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartSweep',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}