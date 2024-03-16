import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'plant.dart';

class EditPlantScreen extends StatefulWidget {
  final Plant plant;

  const EditPlantScreen({required this.plant});

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredPlantName = '';
  String? _selectedPlantType;
  bool _receiveReminders = false;
  List<String> selectedDays = [];
  int hour = 0;
  int minute = 0;
  bool isAM = true;

  final Map<String, String> plantNamesAndIcons = {
    "Tulip": "assets/images/tulip.png",
    "Peony": "assets/images/peony.png",
  };

  @override
  void initState() {
    super.initState();
    _enteredPlantName = widget.plant.enteredPlantName;
    _selectedPlantType = widget
        .plant.plantType; // This should match the key in plantNamesAndIcons
    _receiveReminders = widget.plant.reminder != null;
    // Initialize other fields...
  }

  Widget buildDayButton(String day) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (selectedDays.contains(day)) {
            selectedDays.remove(day);
          } else {
            selectedDays.add(day);
          }
        });
      },
      child: Text(day),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedDays.contains(day) ? Colors.green : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Plant'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Plant updatedPlant = Plant(
                    name: _selectedPlant,
                    iconPath: widget.plant.iconPath,
                    wateringSchedule: _wateringSchedule,
                    reminder: _reminder,
                    enteredPlantName: _enteredPlantName,
                    reminderMessage: reminderMessage,
                  );
                  Navigator.pop(context, updatedPlant);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Remove Plant',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFB8B8B8),
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              initialValue: _enteredPlantName,
              decoration: const InputDecoration(labelText: 'Plant Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a plant name';
                }
                return null;
              },
              onChanged: (value) => _enteredPlantName = value,
            ),
            DropdownButtonFormField<String>(
              value: _selectedPlantType,
              hint: const Text('Select a plant type'),
              onChanged: (newValue) {
                setState(() {
                  _selectedPlantType = newValue;
                });
              },
              items: plantNamesAndIcons.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            CheckboxListTile(
              title: const Text('Receive reminders'),
              value: _receiveReminders,
              onChanged: (bool? value) {
                setState(() {
                  _receiveReminders = value!;
                });
              },
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 25, bottom: 30),
                child: SizedBox(
                  height: 25,
                  child: Text('Edit Watering Schedule',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80),
              child: Container(
                height: 60,
                width: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      buildDayButton('M'),
                      buildDayButton('T'),
                      buildDayButton('W'),
                      buildDayButton('Th'),
                      buildDayButton('F'),
                      buildDayButton('S'),
                      buildDayButton('Su'),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 248, 248),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NumberPicker(
                              selectedTextStyle: const TextStyle(
                                  color: Color.fromARGB(255, 28, 67, 30),
                                  fontSize: 22),
                              minValue: 0,
                              maxValue: 12,
                              value: hour,
                              onChanged: (value) =>
                                  setState(() => hour = value),
                            ),
                            NumberPicker(
                              zeroPad: true,
                              selectedTextStyle: const TextStyle(
                                  color: Color.fromARGB(255, 28, 67, 30),
                                  fontSize: 22),
                              minValue: 0,
                              maxValue: 59,
                              value: minute,
                              onChanged: (value) =>
                                  setState(() => minute = value),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('AM'),
                                Checkbox(
                                  activeColor:
                                      const Color.fromARGB(255, 28, 67, 30),
                                  value: isAM,
                                  onChanged: (value) {
                                    setState(() {
                                      isAM = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('PM'),
                                Checkbox(
                                  activeColor:
                                      const Color.fromARGB(255, 28, 67, 30),
                                  value: !isAM,
                                  onChanged: (value) {
                                    setState(() {
                                      isAM = !value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Plant updatedPlant = Plant(
                    name: _enteredPlantName,
                    iconPath: plantNamesAndIcons[_selectedPlantType] ??
                        widget.plant
                            .iconPath, // Ensure this updates based on selection
                    wateringSchedule:
                        'Every ${selectedDays.join(", ")} at $hour:$minute',
                    reminder: _receiveReminders ? DateTime.now() : null,
                    enteredPlantName: _enteredPlantName,
                    reminderMessage: widget.plant.reminderMessage,
                    plantType: _selectedPlantType ?? widget.plant.plantType,
                  );
                  Navigator.pop(context, updatedPlant);
                }
              },
              child: const Text('Update Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
