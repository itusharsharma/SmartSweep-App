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
  "📷 Scanning 4,216 Photos...",
  "🎥 Checking 382 Videos...",
  "📄 Analyzing 842 Documents...",
  "🗑 Removing Junk Cache...",
  "🤖 AI Optimizing Results..."
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(milliseconds: 900),
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
                        strokeWidth: 14,
                        strokeCap: StrokeCap.round,
                        backgroundColor: Colors.grey.shade300,
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

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Estimated time: 5 seconds",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                    const SizedBox(height: 25),

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.08),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "SmartSweep never uploads your files. Scanning is performed locally.",
                            ),
                          ),
                        ],
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