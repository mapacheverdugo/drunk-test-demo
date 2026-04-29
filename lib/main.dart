import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'data/supabase_config.dart';
import 'portrait_frame.dart';
import 'welcome/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(const DrunkTestDemoApp());
}

class DrunkTestDemoApp extends StatelessWidget {
  const DrunkTestDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drunk Cyclist Test Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ForestColors.iceCream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ForestColors.brandForest,
          primary: ForestColors.brandForest,
          surface: ForestColors.iceCream,
        ),
        fontFamily: 'GT',
      ),
      builder: (context, child) {
        return PortraitFrame(child: child ?? const SizedBox.shrink());
      },
      home: const WelcomePage(),
    );
  }
}
