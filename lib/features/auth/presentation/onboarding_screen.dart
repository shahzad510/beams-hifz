import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/islamic_pattern_bg.dart';
import '../../../core/widgets/premium_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _content = [
    {
      'title': 'Memorize Quran',
      'description': 'Track your Hifz progress beautifully.',
      'icon': 'book',
    },
    {
      'title': 'Expert Teachers',
      'description': 'Connect with qualified teachers worldwide.',
      'icon': 'people',
    },
    {
      'title': 'Parent Dashboard',
      'description': 'Monitor your child\'s progress effortlessly.',
      'icon': 'insights',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IslamicPatternBg(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: _content.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        index == 0 ? Icons.menu_book_rounded : index == 1 ? Icons.people_alt_rounded : Icons.insights_rounded,
                        size: 120,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 48),
                      Text(
                        _content[index]['title']!,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          _content[index]['description']!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).textTheme.bodySmall?.color,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _content.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentIndex == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  PremiumButton(
                    text: _currentIndex == _content.length - 1 ? 'Get Started' : 'Next',
                    onPressed: () {
                      if (_currentIndex == _content.length - 1) {
                        context.go('/role_selection');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
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
