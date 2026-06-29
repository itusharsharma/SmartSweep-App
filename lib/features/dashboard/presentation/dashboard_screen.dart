import 'package:flutter/material.dart';

import '../../../../app/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_rounded),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: "Settings",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Morning 👋",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "SmartSweep",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Your device is running smoothly.",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Storage Used",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "64.2 GB / 128 GB",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const LinearProgressIndicator(
                          value: 0.50,
                          minHeight: 10,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: FilledButton.icon(
                  icon: const Icon(Icons.bolt),
                  label: const Text("Quick Scan"),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 34),

              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  _CategoryCard(Icons.photo, "Photos"),
                  _CategoryCard(Icons.video_library, "Videos"),
                  _CategoryCard(Icons.description, "Documents"),
                  _CategoryCard(Icons.apps, "Apps"),
                ],
              ),

              const SizedBox(height: 30),

              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.cleaning_services,
                        color: Colors.white),
                  ),
                  title: const Text("Last Cleanup"),
                  subtitle: const Text("Yesterday • Freed 1.8 GB"),
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

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CategoryCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 42,
              color: AppColors.primary,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}