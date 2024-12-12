import 'package:flutter/material.dart';

class SuperAdminNotificationsScreen extends StatelessWidget {
  const SuperAdminNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for super admin notifications
    final notifications = [
      'New admin added: Admin 1.',
      'System update scheduled for 1 AM.',
      'Student John Doe is marked for clearance.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Notifications'),
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
