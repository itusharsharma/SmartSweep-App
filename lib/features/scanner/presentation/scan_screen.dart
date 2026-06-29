import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/colors.dart';
import '../../../../app/routes.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  double progress = 0;

  int stage = 0;

  final stages = [
    "Analyzing Photos...",
    "Scanning Videos...",
    "Checking Documents...",
    "Finding Junk Files...",
    "Optimizing Results..."
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(milliseconds: 700),
      (timer) {

        if (progress >= 1) {
          timer.cancel();

          Navigator.pushReplacementNamed(
            context,
            AppRoutes.scanResults,
          );

          return;
        }

        setState(() {
          progress += 0.2;

          if (stage < stages.length - 1) {
            stage++;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      SizedBox(
                        width: 180,
                        height: 180,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 12,
                          color: AppColors.primary,
                        ),
                      ),

                      Text(
                        "${(progress * 100).toInt()}%",
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Scanning Device",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Text(
                    stages[stage],
                    key: ValueKey(stage),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}