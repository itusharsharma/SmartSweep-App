import 'package:flutter/material.dart';

import '../../../../app/colors.dart';
import '../../../../app/routes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Cleaning History"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HistoryCard(
            title: "Today",
            subtitle: "Removed duplicate photos",
            amount: "6.8 GB",
            icon: Icons.cleaning_services,
          ),
          HistoryCard(
            title: "Yesterday",
            subtitle: "Temporary files cleaned",
            amount: "1.8 GB",
            icon: Icons.delete_outline,
          ),
          HistoryCard(
            title: "22 June",
            subtitle: "Large videos removed",
            amount: "820 MB",
            icon: Icons.video_library,
          ),
          HistoryCard(
            title: "15 June",
            subtitle: "Downloads cleaned",
            amount: "3.2 GB",
            icon: Icons.download,
          ),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.dashboard,
              );
              break;

            case 2:
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.settings,
              );
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;

  const HistoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(.15),
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          amount,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}