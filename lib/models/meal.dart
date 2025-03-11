import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String userId;
  int breakfast;
  int lunch;
  int dinner;
  final DateTime date;

  Meal({
    required this.id,
    required this.userId,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'date': date.toIso8601String(),
    };
  }
}
