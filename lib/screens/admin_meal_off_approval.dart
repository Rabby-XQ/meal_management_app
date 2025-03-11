import 'package:flutter/material.dart';

class AdminMealOffApprovalScreen extends StatefulWidget {
  @override
  _AdminMealOffApprovalScreenState createState() => _AdminMealOffApprovalScreenState();
}

class _AdminMealOffApprovalScreenState extends State<AdminMealOffApprovalScreen> {
  List<Map<String, dynamic>> mealOffRequests = [
    {"id": 1, "user": "John Doe", "date": "2025-03-12", "status": "Pending"},
    {"id": 2, "user": "Alice", "date": "2025-03-13", "status": "Pending"},
  ];

  void approveRequest(int index) {
    setState(() {
      mealOffRequests[index]["status"] = "Approved";
    });
  }

  void rejectRequest(int index) {
    setState(() {
      mealOffRequests[index]["status"] = "Rejected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin - Meal Off Requests")),
      body: ListView.builder(
        itemCount: mealOffRequests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text("${mealOffRequests[index]["user"]}"),
              subtitle: Text("Date: ${mealOffRequests[index]["date"]}"),
              trailing: mealOffRequests[index]["status"] == "Pending"
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: () => approveRequest(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () => rejectRequest(index),
                  ),
                ],
              )
                  : Text("${mealOffRequests[index]["status"]}"),
            ),
          );
        },
      ),
    );
  }
}
