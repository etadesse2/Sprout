import 'package:flutter/material.dart';
import 'plant.dart'; // Ensure this import is correct

class AddPlantScreen extends StatefulWidget {
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlant;
  String _wateringSchedule = '';
  DateTime _selectedDate = DateTime.now();

  // Update with actual plant names and their icons
  final Map<String, String> plantNamesAndIcons = {
    "Aloe Vera": "icons/aloe_vera.png",
    "Snake Plant": "icons/snake_plant.png",
    "Fiddle Leaf Fig": "icons/fiddle_leaf_fig.png",
    // Add more plants and their icon paths
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Plant')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            DropdownButtonFormField<String>(
              value: _selectedPlant,
              hint: Text('Select a Plant'),
              onChanged: (newValue) {
                setState(() {
                  _selectedPlant = newValue;
                });
              },
              items: plantNamesAndIcons.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Watering Schedule'),
              onChanged: (value) => _wateringSchedule = value,
            ),
            ListTile(
              title: Text('Select Reminder Date'),
              subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
              onTap: () => _selectDate(context),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Assuming icon selection is based on plant name
                  String iconPath = plantNamesAndIcons[_selectedPlant] ?? '';
                  Plant newPlant = Plant(
                    name: _selectedPlant ?? 'Unknown',
                    iconPath: iconPath,
                    wateringSchedule: _wateringSchedule,
                    reminder: _selectedDate,
                  );
                  Navigator.pop(context, newPlant);
                }
              },
              child: Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
