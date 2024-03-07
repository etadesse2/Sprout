// Import necessary packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plant.dart'; // Ensure this is correctly pointing to your Plant model

class EditPlantScreen extends StatefulWidget {
  final Plant plant;
  EditPlantScreen({required this.plant});

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedPlant;
  late String _wateringSchedule;
  late DateTime _reminder;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // Assuming these are your plant options
  final List<String> _plantOptions = [
    "Aloe Vera",
    "Snake Plant",
    "Fiddle Leaf Fig",
    // Add other plants as needed
  ];

  @override
  void initState() {
    super.initState();
    _selectedPlant = widget.plant.name;
    _wateringSchedule = widget.plant.wateringSchedule;
    _reminder = widget.plant.reminder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Plant'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Plant updatedPlant = Plant(
                  name: _selectedPlant,
                  iconPath: widget.plant
                      .iconPath, // Keep the original icon path for simplicity
                  wateringSchedule: _wateringSchedule,
                  reminder: _reminder,
                );
                Navigator.pop(context, updatedPlant);
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: _selectedPlant,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPlant = newValue!;
                });
              },
              items:
                  _plantOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextFormField(
              initialValue: _wateringSchedule,
              decoration: InputDecoration(labelText: 'Watering Schedule'),
              onChanged: (value) => _wateringSchedule = value,
            ),
            ListTile(
              title: Text('Reminder: ${_dateFormat.format(_reminder)}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _reminder,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (picked != null && picked != _reminder) {
                  setState(() {
                    _reminder = picked;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
