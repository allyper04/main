import 'package:flutter/material.dart';

class StudentNotificationsScreen extends StatelessWidget {
  const StudentNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for student notifications
    final notifications = [
      'Your graduation clearance is now available.',
      'New requirement added: Thesis submission.',
      'Reminder: Upload your final project report.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Notifications'),
        backgroundColor: const Color(0xFF6A11CB),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: const Color(0xFF6A11CB),
                child: ListTile(
                  title: Text(
                    notifications[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
