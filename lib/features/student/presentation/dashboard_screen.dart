import 'package:flutter/material.dart';
import '../../../core/widgets/islamic_pattern_bg.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/animated_progress.dart';
import '../../../core/widgets/audio_visualizer.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IslamicPatternBg(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120.0,
              floating: true,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                title: Text(
                  'Assalamu Alaikum,\nAhmad',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(LucideIcons.bell),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlassCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily Goal',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Icon(LucideIcons.target, color: Theme.of(context).colorScheme.primary),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const AnimatedProgress(progress: 0.65, label: 'Al-Baqarah (1-15)'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Recent Recitation',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    GlassCard(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(LucideIcons.play, color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Surah Al-Mulk', style: Theme.of(context).textTheme.titleMedium),
                                const SizedBox(height: 8),
                                const AudioVisualizer(isPlaying: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(LucideIcons.home), label: 'Home'),
          NavigationDestination(icon: Icon(LucideIcons.book), label: 'Quran'),
          NavigationDestination(icon: Icon(LucideIcons.user), label: 'Profile'),
          NavigationDestination(icon: Icon(LucideIcons.settings), label: 'Settings'),
        ],
        selectedIndex: 0,
      ),
    );
  }
}
