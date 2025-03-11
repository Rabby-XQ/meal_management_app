import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealService extends ChangeNotifier {
  List<Meal> _meals = [];

  List<Meal> get meals => _meals;

  void addMeal(Meal meal) {
    _meals.add(meal);
    notifyListeners();
  }

  void deleteMeal(String id) {
    _meals.removeWhere((meal) => meal.id == id);
    notifyListeners();
  }

  void updateMeal(String id, int breakfast, int lunch, int dinner) {
    final index = _meals.indexWhere((meal) => meal.id == id);
    if (index != -1) {
      _meals[index] = Meal(
        id: id,
        userId: _meals[index].userId,
        breakfast: breakfast,
        lunch: lunch,
        dinner: dinner,
        date: _meals[index].date,
      );
      notifyListeners();
    }
  }
}
