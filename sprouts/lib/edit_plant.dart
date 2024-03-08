import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plant.dart'; // Ensure this is correctly pointing to your Plant model

class EditPlantScreen extends StatefulWidget {
  final Plant plant;

  const EditPlantScreen({required this.plant});

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPlant = '';
  String _wateringSchedule = '';
  DateTime _reminder = DateTime.now();

  final Map<String, String> plantNamesAndIcons = {
    "Tulip": "assets/images/tulip.png",
    "Peony": "assets/images/peony.png",
  };

  @override
  void initState() {
    super.initState();
    // Initialize form fields with the current plant data
    _selectedPlant = widget.plant.name;
    _wateringSchedule = widget.plant.wateringSchedule;
    _reminder = widget.plant.reminder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.plant.name}'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            TextFormField(
              initialValue: _selectedPlant,
              decoration: InputDecoration(labelText: 'Plant Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a plant name';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _selectedPlant = value;
                });
              },
            ),
            TextFormField(
              initialValue: _wateringSchedule,
              decoration: InputDecoration(labelText: 'Watering Schedule'),
              onChanged: (value) {
                setState(() {
                  _wateringSchedule = value;
                });
              },
            ),
            ListTile(
              title: Text('Select Reminder Date'),
              subtitle: Text('${DateFormat('yyyy-MM-dd').format(_reminder)}'),
              onTap: () => _selectDate(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
              child: SizedBox(
                width: 250,
                child: FloatingActionButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Plant updatedPlant = Plant(
                        name: _selectedPlant,
                        iconPath: widget.plant.iconPath,
                        wateringSchedule: _wateringSchedule,
                        reminder: _reminder,
                        enteredPlantName: widget.plant.enteredPlantName,
                      );
                      Navigator.pop(context, updatedPlant);
                    }
                  },
                  backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Update Plant',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
  }
}
