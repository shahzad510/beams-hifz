import 'package:flutter/material.dart';
import '../../../core/widgets/islamic_pattern_bg.dart';
import '../../../core/widgets/glass_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: IslamicPatternBg(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            GlassCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(LucideIcons.moon),
                    title: const Text('Dark Mode'),
                    trailing: Switch(value: Theme.of(context).brightness == Brightness.dark, onChanged: (v) {}),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(LucideIcons.globe),
                    title: Text('Language'),
                    trailing: Text('English'),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(LucideIcons.bell),
                    title: Text('Notifications'),
                    trailing: Icon(LucideIcons.chevronRight),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GlassCard(
              padding: EdgeInsets.zero,
              child: const ListTile(
                leading: Icon(LucideIcons.logOut, color: Colors.red),
                title: Text('Logout', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
