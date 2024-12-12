import 'package:flutter/material.dart';

class ViewAdminsScreen extends StatelessWidget {
  const ViewAdminsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of admins
    final admins = [
      {'name': 'Admin 1', 'email': 'admin1@example.com'},
      {'name': 'Admin 2', 'email': 'admin2@example.com'},
      {'name': 'Admin 3', 'email': 'admin3@example.com'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Admins'),
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
            itemCount: admins.length,
            itemBuilder: (context, index) {
              final admin = admins[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: const Color(0xFF6A11CB),
                child: ListTile(
                  title: Text(
                    admin['name']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    admin['email']!,
                    style: const TextStyle(color: Colors.white70),
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
