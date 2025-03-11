import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/meal_service.dart';
import '../models/meal.dart';
import 'meal_entry_screen.dart';

class MemberDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealService = Provider.of<MealService>(context);
    final meals = mealService.meals;

    return Scaffold(
      appBar: AppBar(title: Text('Member Dashboard')),
      body: meals.isEmpty
          ? Center(child: Text('No meals logged yet!'))
          : ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            title: Text('Date: ${meal.date.toLocal().toString().split(' ')[0]}'),
            subtitle: Text('Breakfast: ${meal.breakfast}, Lunch: ${meal.lunch}, Dinner: ${meal.dinner}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MealEntryScreen())),
      ),
    );
  }
}
