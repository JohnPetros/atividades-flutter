import 'package:flutter/material.dart';

import 'screens/average_calculator_screen.dart';
import 'screens/discount_calculator_screen.dart';
import 'screens/daily_tasks_screen.dart';
import 'screens/home_screen.dart';
import 'screens/rectangle_area_screen.dart';
import 'screens/shopping_list_screen.dart';
import 'screens/temperature_converter_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduCalc & Tarefas',
      theme: _appTheme,
      home: const HomeScreen(),
      routes: {
        '/temperature': (_) => const TemperatureConverterScreen(),
        '/average': (_) => const AverageCalculatorScreen(),
        '/discount': (_) => const DiscountCalculatorScreen(),
        '/area': (_) => const RectangleAreaScreen(),
        '/shopping': (_) => const ShoppingListScreen(),
        '/tasks': (_) => const DailyTasksScreen(),
      },
    );
  }
}

final ThemeData _appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    onPrimary: AppColors.background,
    onSecondary: AppColors.background,
    onSurface: AppColors.primaryText,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 52,
      height: 1.15,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      height: 1.2,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryText,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryText,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryText,
    ),
  ),
);
