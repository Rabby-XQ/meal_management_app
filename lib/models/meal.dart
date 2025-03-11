class Meal {
  final String id;
  final String userId;
  final int breakfast;
  final int lunch;
  final int dinner;
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

  static Meal fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      userId: map['userId'],
      breakfast: map['breakfast'],
      lunch: map['lunch'],
      dinner: map['dinner'],
      date: DateTime.parse(map['date']),
    );
  }
}
