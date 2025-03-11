import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../services/meal_service.dart';
import '../models/meal.dart';

class MealEntryScreen extends StatefulWidget {
  @override
  _MealEntryScreenState createState() => _MealEntryScreenState();
}

class _MealEntryScreenState extends State<MealEntryScreen> {
  int breakfast = 0;
  int lunch = 0;
  int dinner = 0;

  @override
  Widget build(BuildContext context) {
    final mealService = Provider.of<MealService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Log Your Meals')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _mealCounter('Breakfast', (value) => setState(() => breakfast = value)),
            _mealCounter('Lunch', (value) => setState(() => lunch = value)),
            _mealCounter('Dinner', (value) => setState(() => dinner = value)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                mealService.addMeal(Meal(
                  id: Uuid().v4(),
                  userId: 'user123', // Replace with actual user ID
                  breakfast: breakfast,
                  lunch: lunch,
                  dinner: dinner,
                  date: DateTime.now(),
                ));
                Navigator.pop(context);
              },
              child: Text('Save Meal'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mealCounter(String mealType, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mealType, style: TextStyle(fontSize: 18)),
        Row(
          children: [
            IconButton(icon: Icon(Icons.remove), onPressed: () => onChanged(_decrement(mealType))),
            Text(mealType == 'Breakfast' ? '$breakfast' : mealType == 'Lunch' ? '$lunch' : '$dinner', style: TextStyle(fontSize: 18)),
            IconButton(icon: Icon(Icons.add), onPressed: () => onChanged(_increment(mealType))),
          ],
        ),
      ],
    );
  }

  int _increment(String mealType) {
    if (mealType == 'Breakfast') return breakfast + 1;
    if (mealType == 'Lunch') return lunch + 1;
    return dinner + 1;
  }

  int _decrement(String mealType) {
    if (mealType == 'Breakfast') return breakfast > 0 ? breakfast - 1 : 0;
    if (mealType == 'Lunch') return lunch > 0 ? lunch - 1 : 0;
    return dinner > 0 ? dinner - 1 : 0;
  }
}
