import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/env/env_config.dart';
import 'core/firebase/firebase_setup.dart';
import 'core/theme/theme_manager.dart';
import 'core/navigation/app_router.dart';
import 'core/localization/app_localizations_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Environment Variables
  await EnvConfig.init();

  // Initialize Firebase
  await FirebaseSetup.init();

  runApp(
    const ProviderScope(
      child: BeamsHifzApp(),
    ),
  );
}

class BeamsHifzApp extends ConsumerWidget {
  const BeamsHifzApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Beams Hifz',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.system, // Or read from a settings provider
      routerConfig: router,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
    );
  }
}
