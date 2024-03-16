import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'plant.dart'; // Ensure this is correctly pointing to your Plant model

class EditPlantScreen extends StatefulWidget {
  final Plant plant;

  const EditPlantScreen({required this.plant});

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedPlant;
  late String _wateringSchedule;
  late DateTime _reminder;
  String _enteredPlantName = '';
  bool _receiveReminders = false;
  List<String> selectedDays = [];
  int hour = 0;
  int minute = 0;
  bool isAM = true;
  String reminderMessage = '';

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
    _reminder = widget.plant.reminder ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'SPROUT',
          style: TextStyle(
              letterSpacing: 10,
              fontSize: 40,
              color: Color.fromARGB(255, 28, 67, 30)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              initialValue: _selectedPlant,
              decoration: const InputDecoration(labelText: 'Plant Name'),
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
            const SizedBox(height: 25),
            const Center(child: Text('Current Watering Schedule')),
            Center(
              child: Text(
                _wateringSchedule,
                style: const TextStyle(fontSize: 18),
              ),
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
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      buildDayButton('M', 'Monday'),
                      buildDayButton('T', 'Tuesday'),
                      buildDayButton('W', 'Wednesday'),
                      buildDayButton('Th', 'Thursday'),
                      buildDayButton('F', 'Friday'),
                      buildDayButton('S', 'Saturday'),
                      buildDayButton('Su', 'Sunday'),
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
                        reminderMessage: '',
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

  buildDayButton(String abbreviation, String dayName) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (selectedDays.contains(dayName)) {
            selectedDays.remove(dayName);
          } else {
            selectedDays.add(dayName);
          }
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: selectedDays.contains(dayName)
            ? const Color.fromARGB(255, 28, 67, 30)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: selectedDays.contains(dayName)
                ? Colors.transparent
                : Color.fromARGB(0, 103, 103, 103),
          ),
        ),
      ),
      child: Text(
        abbreviation,
        style: TextStyle(
          color: selectedDays.contains(dayName)
              ? Colors.white
              : const Color(0xFF676767),
        ),
      ),
    );
  }
}
