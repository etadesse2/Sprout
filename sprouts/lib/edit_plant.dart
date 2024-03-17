import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'plant.dart';

class EditPlantScreen extends StatefulWidget {
  final Plant plant;

  const EditPlantScreen({super.key, required this.plant});

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
    _enteredPlantName = widget.plant.name;
    _selectedPlantType = widget.plant.plantType;
    _receiveReminders = widget.plant.reminder != null;
    // Assuming your Plant class has a method to parse the watering schedule to get hour, minute, isAM, and selectedDays
  }

  Widget buildDayButton(String day) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (selectedDays.contains(day)) {
            selectedDays.remove(day);
          } else {
            selectedDays.add(day);
          }
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: selectedDays.contains(day)
            ? const Color.fromARGB(255, 28, 67, 30)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: selectedDays.contains(day)
                ? Colors.transparent
                : const Color.fromARGB(0, 103, 103, 103),
          ),
        ),
      ),
      child: Text(
        day,
        style: TextStyle(
          color: selectedDays.contains(day)
              ? Colors.white
              : const Color(0xFF676767),
        ),
      ),
    );
  }

  String _generateWateringSchedule() {
    return 'Every ${selectedDays.join(", ")} at ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${isAM ? "AM" : "PM"}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'SPROUT',
          style: TextStyle(
              letterSpacing: 10,
              fontSize: 40,
              color: Color.fromARGB(255, 28, 67, 30)),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String updatedIconPath =
                      plantNamesAndIcons[_selectedPlantType] ??
                          widget.plant.iconPath;
                  Plant updatedPlant = Plant(
                    name:
                        _enteredPlantName, // or some other variable if `name` is different from `enteredPlantName`
                    iconPath: updatedIconPath,
                    wateringSchedule: _generateWateringSchedule(),
                    reminder: _receiveReminders
                        ? DateTime.now()
                        : widget.plant.reminder,
                    enteredPlantName: _enteredPlantName,
                    reminderMessage: widget.plant
                        .reminderMessage, // or some other logic for setting reminderMessage
                    plantType: _selectedPlantType ??
                        widget.plant
                            .plantType, // or some other logic for plantType
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
                Navigator.pop(context, 'remove');
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
              decoration: const InputDecoration(
                  labelText: 'Plant Name',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 28, 67, 30)))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a plant name';
                }
                return null;
              },
              onChanged: (value) => _enteredPlantName = value,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 28, 67, 30))),
              ),
              dropdownColor: Colors.white,
              value: _selectedPlantType,
              hint: const Text('Select a plant type'),
              onChanged: (newValue) {
                setState(() {
                  _selectedPlantType = newValue;
                });
              },
              items: plantNamesAndIcons.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(plantNamesAndIcons[value]!),
                        ),
                      ),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              // plantNamesAndIcons.keys.map((String value) {
              //   return DropdownMenuItem<String>(
              //     value: value,
              //     child: Text(value),
              //   );
              // }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
              child: Center(
                child: Container(
                  height: 60,
                  width: 455,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 248, 248),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
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
                      ],
                    ),
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
            CheckboxListTile(
              activeColor: const Color.fromARGB(255, 28, 67, 30),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Center(child: Text('Receive reminders')),
              value: _receiveReminders,
              onChanged: (bool? value) {
                setState(() {
                  _receiveReminders = value!;
                });
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (_formKey.currentState!.validate()) {
            //       String updatedIconPath =
            //           plantNamesAndIcons[_selectedPlantType] ??
            //               widget.plant.iconPath;
            //       Plant updatedPlant = Plant(
            //         name:
            //             _enteredPlantName, // or some other variable if `name` is different from `enteredPlantName`
            //         iconPath: updatedIconPath,
            //         wateringSchedule: _generateWateringSchedule(),
            //         reminder: _receiveReminders
            //             ? DateTime.now()
            //             : widget.plant.reminder,
            //         enteredPlantName: _enteredPlantName,
            //         reminderMessage: widget.plant
            //             .reminderMessage, // or some other logic for setting reminderMessage
            //         plantType: _selectedPlantType ??
            //             widget.plant
            //                 .plantType, // or some other logic for plantType
            //       );

            //       Navigator.pop(context, updatedPlant);
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 28, 67, 30),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //   ),
            //   child: const Text(
            //     'Save Changes',
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.white,
            //       letterSpacing: 1,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            //const SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context, null);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xFFF5F5F5),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //     minimumSize: const Size(double.infinity, 50),
            //   ),
            //   child: const Text(
            //     'Cancel',
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Color(0xFFB8B8B8),
            //       letterSpacing: 1,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
