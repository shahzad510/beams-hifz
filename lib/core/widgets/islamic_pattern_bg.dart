import 'package:flutter/material.dart';

class IslamicPatternBg extends StatelessWidget {
  final Widget child;
  final double opacity;

  const IslamicPatternBg({
    super.key,
    required this.child,
    this.opacity = 0.03,
  });

  @override
  Widget build(BuildContext context) {
    // In a real app we would use an SVG pattern, but for now we simulate it with a soft gradient and an icon pattern
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        // Decorative background elements (simulate geometric patterns)
        Positioned(
          top: -100,
          right: -100,
          child: Opacity(
            opacity: opacity,
            child: Icon(
              Icons.star_border_rounded,
              size: 400,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -50,
          child: Opacity(
            opacity: opacity,
            child: Icon(
              Icons.brightness_4_outlined,
              size: 500,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        // Soft Glows
        Positioned(
          top: 100,
          left: -50,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: isDark ? 0.1 : 0.05),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: isDark ? 0.1 : 0.05),
                  blurRadius: 100,
                  spreadRadius: 100,
                )
              ],
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
