import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/colors.dart';
import '../../../../app/routes.dart';

class CleaningScreen extends StatefulWidget {
  const CleaningScreen({super.key});

  @override
  State<CleaningScreen> createState() => _CleaningScreenState();
}

class _CleaningScreenState extends State<CleaningScreen> {

  double progress = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(milliseconds: 120),
      (timer) {

        if (progress >= 1) {
          timer.cancel();

          _showSuccess();

          return;
        }

        setState(() {
          progress += 0.03;
        });
      },
    );
  }

  void _showSuccess() {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const CircleAvatar(
                radius: 42,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 45,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Cleanup Complete!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "6.8 GB has been freed successfully.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),

              FilledButton(
                onPressed: () {

                  Navigator.pop(context);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.dashboard,
                    (route) => false,
                  );

                },
                child: const Text("Back to Dashboard"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Cleaning"),
      ),

      body: Center(
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
                "Cleaning Files...",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Removing unnecessary files safely",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}