import 'package:flutter/material.dart';

class StudentMyRequirementsScreen extends StatelessWidget {
  const StudentMyRequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of requirements for the student (you can fetch this from Firebase or another data source)
    List<Map<String, String>> requirements = [
      {'requirement': 'Submit Thesis Proposal', 'status': 'Not Submitted'},
      {'requirement': 'Complete Internship', 'status': 'Not Started'},
      {'requirement': 'Submit Final Thesis', 'status': 'Not Submitted'},
      {'requirement': 'Pass the Final Defense', 'status': 'Pending'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Requirements'),
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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Graduation Requirements:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: requirements.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          requirements[index]['requirement']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          'Status: ${requirements[index]['status']}',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Handle upload logic here
                            _showUploadDialog(context);
                          },
                          child: const Text('Upload'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2575FC),
                          ),
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

  // Show a dialog when clicking the Upload button
  void _showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Requirement'),
          content: const Text(
              'Please select the file to upload for this requirement.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform upload action (you can replace this with actual file upload logic)
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('File uploaded successfully!')),
                );
              },
              child: const Text('Upload'),
            ),
          ],
        );
      },
    );
  }
}
