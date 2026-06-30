import 'package:flutter/material.dart';

import '../../../../app/colors.dart';
import '../../../../app/routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              subtitle: const Text("Coming in V2"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          const SizedBox(height: 12),


          const SizedBox(height: 12),

          Card(
  child: ListTile(
    leading: const Icon(Icons.info_outline),
    title: const Text("About SmartSweep"),
    subtitle: const Text("AI-powered storage cleaning assistant"),
    trailing: const Icon(Icons.chevron_right),
    onTap: () {
      showAboutDialog(
        context: context,
        applicationName: "SmartSweep",
        applicationVersion: "1.0",
        applicationLegalese: "Evaluation Edition",
      );
    },
  ),
),

          const SizedBox(height: 12),

          const Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Version"),
              trailing: Text("V1.0"),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "SmartSweep Evaluation Edition",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),bottomNavigationBar: NavigationBar(
  selectedIndex: 2,
  onDestinationSelected: (index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.dashboard,
        );
        break;

      case 1:
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.history,
        );
        break;
    }
  },
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
    );
  }
}