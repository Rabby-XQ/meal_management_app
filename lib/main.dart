import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'services/meal_service.dart';
import 'screens/home_screen.dart';
import 'theme.dart'; // Import custom theme

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => MealService()),
      ],
      child: MealManagementApp(),
    ),
  );
}

class MealManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meal Management',
          themeMode: themeProvider.themeMode,
          theme: AppThemes.lightTheme, // Custom light theme
          darkTheme: AppThemes.darkTheme, // Custom dark theme
          home: HomeScreen(),
        );
      },
    );
  }
}
