import 'package:flutter/material.dart';
import '../../../core/widgets/islamic_pattern_bg.dart';
import '../../../core/widgets/glass_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: IslamicPatternBg(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(LucideIcons.user, size: 50),
            ),
            const SizedBox(height: 16),
            Text(
              'Ahmad Student',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statistics', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  const ListTile(
                    leading: Icon(LucideIcons.bookOpen),
                    title: Text('Memorized Ajza'),
                    trailing: Text('3 / 30', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const ListTile(
                    leading: Icon(LucideIcons.star),
                    title: Text('Total Points'),
                    trailing: Text('1,250', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
