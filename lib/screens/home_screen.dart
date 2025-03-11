import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'admin_dashboard.dart';
import 'meal_history_screen.dart';  // Import Meal History Screen
import 'meal_manager_screen.dart';
import 'profile_screen.dart';
import 'meal_entry_screen.dart';  // Import Meal Entry Screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Management System'),
        actions: [
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(context, "Admin Panel", AdminDashboard()),
            SizedBox(height: 16),
            _customButton(context, "Meal Manager", MealManagerScreen()),
            SizedBox(height: 16),
            _customButton(context, "Member Dashboard", ProfileScreen()),
            SizedBox(height: 16),
            _customButton(context, "Meal History", MealHistoryScreen()),  // ✅ Added Meal History Button
            SizedBox(height: 16),
            _customButton(context, "Log Meal", MealEntryScreen()),  // ✅ Log Meal Button
          ],
        ),
      ),
    );
  }

  Widget _customButton(BuildContext context, String title, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
