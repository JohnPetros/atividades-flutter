import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/menu_exercicios_screen.dart';

void main() {
  runApp(const FlutterLabApp());
}

class FlutterLabApp extends StatelessWidget {
  const FlutterLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const MenuExerciciosScreen(),
    );
  }
}
