import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to meal managers list
              },
              child: Text('View Meal Managers'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to members list
              },
              child: Text('View Members'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to error reports
              },
              child: Text('Review Errors'),
            ),
          ],
        ),
      ),
    );
  }
}
