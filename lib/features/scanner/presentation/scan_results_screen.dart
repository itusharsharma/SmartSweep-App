import 'package:flutter/material.dart';

import '../../../../app/colors.dart';
import '../../../../app/routes.dart';

class ScanResultsScreen extends StatelessWidget {
  const ScanResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Scan Results"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 70,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Scan Complete",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Potential storage that can be freed",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "6.8 GB",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const _ResultTile(
                Icons.photo_library,
                "Duplicate Photos",
                "312 items",
                "2.4 GB",
              ),

              const _ResultTile(
                Icons.video_collection,
                "Large Videos",
                "18 files",
                "2.1 GB",
              ),

              const _ResultTile(
                Icons.description,
                "Temporary Files",
                "153 files",
                "1.5 GB",
              ),

              const _ResultTile(
                Icons.archive,
                "Downloads",
                "81 files",
                "0.8 GB",
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: FilledButton.icon(
                  icon: const Icon(Icons.cleaning_services),
                  label: const Text("Clean Now"),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.cleaning,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String size;

  const _ResultTile(
    this.icon,
    this.title,
    this.subtitle,
    this.size, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.15),
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          size,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}