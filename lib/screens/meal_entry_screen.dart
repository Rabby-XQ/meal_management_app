import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/meal_service.dart';
import '../models/meal.dart';
import 'package:uuid/uuid.dart';

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
            _mealCounter('Breakfast', breakfast, (value) => setState(() => breakfast = value)),
            _mealCounter('Lunch', lunch, (value) => setState(() => lunch = value)),
            _mealCounter('Dinner', dinner, (value) => setState(() => dinner = value)),
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

  Widget _mealCounter(String mealType, int mealCount, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mealType, style: TextStyle(fontSize: 18)),
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() {
                  if (mealCount > 0) onChanged(mealCount - 1);
                })),
            Text('$mealCount', style: TextStyle(fontSize: 18)),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  onChanged(mealCount + 1);
                })),
          ],
        ),
      ],
    );
  }
}
