import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MealService extends ChangeNotifier {
  List<Meal> _meals = [];

  List<Meal> get meals => _meals;

  MealService() {
    _loadMeals();
  }

  void addMeal(Meal meal) {
    _meals.add(meal);
    _saveMeals();
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
      _saveMeals();
      notifyListeners();
    }
  }

  Future<void> _loadMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealData = prefs.getString('meals');
    if (mealData != null) {
      final List<dynamic> decodedMeals = jsonDecode(mealData);
      _meals = decodedMeals.map((meal) => Meal.fromMap(meal)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMeals = jsonEncode(_meals.map((meal) => meal.toMap()).toList());
    await prefs.setString('meals', encodedMeals);
  }
}
