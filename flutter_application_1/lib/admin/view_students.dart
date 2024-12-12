import 'package:flutter/material.dart';

class ViewStudentsScreen extends StatefulWidget {
  const ViewStudentsScreen({super.key});

  @override
  _ViewStudentsScreenState createState() => _ViewStudentsScreenState();
}

class _ViewStudentsScreenState extends State<ViewStudentsScreen> {
  // Dummy list of students
  final List<Map<String, String>> students = [
    {'name': 'John Doe', 'id': '2022-10255'},
    {'name': 'Jane Smith', 'id': '2022-10256'},
    {'name': 'Alice Johnson', 'id': '2022-10257'},
  ];

  // List to store the filtered students
  List<Map<String, String>> filteredStudents = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStudents = students; // Initially show all students
    searchController
        .addListener(_filterStudents); // Set up listener for search bar
  }

  // Filter students based on search text
  void _filterStudents() {
    setState(() {
      filteredStudents = students
          .where((student) =>
              student['name']!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              student['id']!.contains(searchController.text))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Clean up the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Students'),
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
          child: Column(
            children: [
              // Search Bar
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by name or ID',
                  labelStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white30,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // List of filtered students
              Expanded(
                child: ListView.builder(
                  itemCount: filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFF6A11CB),
                      child: ListTile(
                        title: Text(
                          student['name']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          student['id']!,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
