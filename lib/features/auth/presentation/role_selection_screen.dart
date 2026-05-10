import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/islamic_pattern_bg.dart';
import '../../../core/widgets/glass_card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../domain/entities/user_profile.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  Widget _buildRoleCard(BuildContext context, String title, String subtitle, IconData icon, UserRole role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GlassCard(
        onTap: () => context.push('/signup', extra: role),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IslamicPatternBg(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Choose Your Role',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Select how you will use Beams Hifz',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    children: [
                      _buildRoleCard(context, 'Student', 'Memorize and track your progress', LucideIcons.graduationCap, UserRole.student),
                      _buildRoleCard(context, 'Teacher', 'Manage classes and students', LucideIcons.bookOpen, UserRole.teacher),
                      _buildRoleCard(context, 'Parent', 'Monitor your child\'s progress', LucideIcons.users, UserRole.parent),
                      _buildRoleCard(context, 'Admin', 'Manage platform and users', LucideIcons.shield, UserRole.admin),
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
