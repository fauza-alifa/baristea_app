import 'package:baristea_app/screens/splash_screen.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BaristeaApp());
}

class BaristeaApp extends StatelessWidget {
  const BaristeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SplashScreen(),
    );
  }
}