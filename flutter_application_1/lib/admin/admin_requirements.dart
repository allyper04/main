import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import the file_picker package

// Global list to store requirements
List<Map<String, dynamic>> requirements = [];

class AdminRequirementsScreen extends StatefulWidget {
  const AdminRequirementsScreen({super.key});

  @override
  State<AdminRequirementsScreen> createState() =>
      _AdminRequirementsScreenState();
}

class _AdminRequirementsScreenState extends State<AdminRequirementsScreen> {
  final TextEditingController _requirementController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _fileName; // Stores the name of the selected file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Requirements'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manage Requirements',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showAddRequirementDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2575FC),
                ),
                child: const Text('Add New Requirement'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Existing Requirements:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: requirements.length,
                  itemBuilder: (context, index) {
                    final requirement = requirements[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFF6A11CB),
                      child: ListTile(
                        title: Text(
                          requirement['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'File: ${requirement['file']}, Due: ${requirement['date']} ${requirement['time']}',
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

  // Show a dialog to add a new requirement
  void _showAddRequirementDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Requirement'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Requirement Name TextField
                TextField(
                  controller: _requirementController,
                  decoration: const InputDecoration(
                    labelText: 'Requirement Name',
                    hintText: 'Enter requirement name',
                  ),
                ),
                const SizedBox(height: 10),
                // File Upload Button (Using FilePicker)
                ElevatedButton(
                  onPressed: () async {
                    try {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          _fileName = result.files.single
                              .name; // Store the file name temporarily
                        });
                      } else {
                        setState(() {
                          _fileName = 'No file selected';
                        });
                      }
                    } catch (e) {
                      // Handle any errors that occur during file picking
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error picking file: $e')),
                      );
                    }
                  },
                  child: Text(_fileName == null
                      ? 'Upload File'
                      : 'File: $_fileName'),
                ),

                const SizedBox(height: 10),
                // Date Picker
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(_selectedDate == null
                      ? 'Select Date'
                      : 'Date: ${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}'),
                ),
                const SizedBox(height: 10),
                // Time Picker
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    }
                  },
                  child: Text(_selectedTime == null
                      ? 'Select Time'
                      : 'Time: ${_selectedTime!.format(context)}'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_requirementController.text.isNotEmpty &&
                    _selectedDate != null &&
                    _selectedTime != null &&
                    _fileName != null) {
                  // Add new requirement to the global array
                  setState(() {
                    requirements.add({
                      'name': _requirementController.text,
                      'file': _fileName!,
                      'date':
                          '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}', // Date in MM/DD/YYYY format
                      'time': _selectedTime!
                          .format(context), // Time in HH:mm AM/PM format
                    });
                  });
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  // Show error message if fields are not complete
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Add Requirement'),
            ),
          ],
        );
      },
    );
  }
}
