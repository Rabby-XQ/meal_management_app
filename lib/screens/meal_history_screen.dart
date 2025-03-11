import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/meal_service.dart';
import '../models/meal.dart';

class MealHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealService = Provider.of<MealService>(context);
    final meals = mealService.meals;

    return Scaffold(
      appBar: AppBar(title: Text('Meal History')),
      body: meals.isEmpty
          ? Center(child: Text("No meals logged yet."))
          : ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                "${meal.date.toLocal()}".split(' ')[0],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Breakfast: ${meal.breakfast}, Lunch: ${meal.lunch}, Dinner: ${meal.dinner}",
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      _editMeal(context, meal);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      mealService.deleteMeal(meal.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _editMeal(BuildContext context, Meal meal) {
    TextEditingController breakfastController =
    TextEditingController(text: meal.breakfast.toString());
    TextEditingController lunchController =
    TextEditingController(text: meal.lunch.toString());
    TextEditingController dinnerController =
    TextEditingController(text: meal.dinner.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Meal Entry"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField("Breakfast", breakfastController),
            _buildTextField("Lunch", lunchController),
            _buildTextField("Dinner", dinnerController),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Save"),
            onPressed: () {
              Provider.of<MealService>(context, listen: false).updateMeal(
                meal.id,
                int.parse(breakfastController.text),
                int.parse(lunchController.text),
                int.parse(dinnerController.text),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }
}
