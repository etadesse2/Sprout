import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'plant.dart';

class AddPlantScreen extends StatefulWidget {
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlant;
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
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Plant Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 28, 67, 30)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter plant name';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _enteredPlantName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 28, 67, 30))),
              ),
              dropdownColor: Colors.white,
              value: _selectedPlant,
              hint: const Text('Select a Plant'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a plant';
                }
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  _selectedPlant = newValue;
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
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 25, bottom: 30),
                child: SizedBox(
                  height: 25,
                  child:
                      Text('Watering Schedule', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Container(
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Center(
              child: Center(
                child: CheckboxListTile(
                  title: const Center(child: Text('Remind me watering times')),
                  value: _receiveReminders,
                  activeColor: const Color.fromARGB(255, 28, 67, 30),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      _receiveReminders = value!;
                      if (_receiveReminders) {
                        reminderMessage =
                            'Reminder set on ${selectedDays.join(', ')}';
                      } else {
                        reminderMessage = '';
                      }
                    });
                  },
                ),
              ),
            ),
          ],
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
                  Plant newPlant = Plant(
                    name: _enteredPlantName,
                    iconPath: plantNamesAndIcons[_selectedPlant] ?? '',
                    wateringSchedule: _generateWateringSchedule(),
                    reminder: _receiveReminders ? DateTime.now() : null,
                    enteredPlantName: _enteredPlantName,
                    reminderMessage: reminderMessage,
                    plantType: _selectedPlant ??
                        'Unknown', // Provide the plantType value
                  );

                  Navigator.pop(context, newPlant);
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
                'Add Plant',
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
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Cancel',
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
    );
  }

  Widget buildDayButton(String abbreviation, String dayName) {
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
                : const Color.fromARGB(0, 103, 103, 103),
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

  String _generateWateringSchedule() {
    String days = selectedDays.join(', ');
    String time =
        '$hour:${minute < 10 ? '0$minute' : '$minute'} ${isAM ? 'AM' : 'PM'}';
    //String time = '$hour:$minute ${isAM ? 'AM' : 'PM'}';
    return 'Water on $days at $time';
  }
}





















      

















// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: const Text(
//               'SPROUT',
//               style: TextStyle(
//                   letterSpacing: 10,
//                   fontSize: 40,
//                   color: Color.fromARGB(255, 28, 67, 30)),
//             ),
//             centerTitle: true,
//             toolbarHeight: 120,
//           ),
//           body: const SingleChildScrollView(
//             child: AddPlant(),
//           )),
//     );
//   }
// }

// class AddPlant extends StatefulWidget {
//   const AddPlant({super.key});

//   @override
//   State<AddPlant> createState() => AddPlantState();
// }

// class AddPlantState extends State<AddPlant> {
//   String dropdownvalue = 'Select Plant';
//   bool? value;
//   void daySelect() {
//     final String dayName;
//     final String dayKey;
//   }

//   var hour = 0;
//   var minute = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 15),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Enter Plant Name',
//                 focusedBorder: UnderlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Color.fromARGB(255, 28, 67, 30)))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 25.0),
//           child: DropdownButton<String>(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               value: dropdownvalue,
//               items: [
//                 const DropdownMenuItem(
//                   value: 'Select Plant',
//                   child: Text('Select Plant',
//                       style: TextStyle(color: Color(0xFF676767))),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Tulip',
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 40,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Image.asset('assets/images/tulip.png'),
//                         ),
//                       ),
//                       const Text('Tulip',
//                           style: TextStyle(color: Color(0xFF676767))),
//                     ],
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Peony',
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 40,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Image.asset('assets/images/peony.png'),
//                         ),
//                       ),
//                       const Text('Peony',
//                           style: TextStyle(color: Color(0xFF676767))),
//                     ],
//                   ),
//                 ),
//               ],
//               onChanged: (String? newValue) {
//                 setState(() {
//                   dropdownvalue = newValue!;
//                 });
//               }),
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 30.0),
//           child: Text(
//             'Create Watering Schedule',
//             style: TextStyle(color: Color(0xFF676767)),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
//           child: SelectWeekDays(
//             onSelect: daySelect,
//             days: [
//               DayInWeek('M', dayKey: 'Monday'),
//               DayInWeek('T', dayKey: 'Tuesday'),
//               DayInWeek('W', dayKey: 'Wednesday'),
//               DayInWeek('TH', dayKey: 'Thursday'),
//               DayInWeek('F', dayKey: 'Friday'),
//               DayInWeek('ST', dayKey: 'Saturday'),
//               DayInWeek('S', dayKey: 'Sunday'),
//             ],
//             border: true,
//             unSelectedDayTextColor: const Color(0xFF676767),
//             selectedDayTextColor: Colors.white,
//             daysBorderColor: const Color(0xFFF5F5F5),
//             daysFillColor: const Color.fromARGB(255, 28, 67, 30),
//             boxDecoration: BoxDecoration(
//               color: const Color(0xFFF5F5F5),
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
//         const Padding(padding: EdgeInsets.only(top: 20)),
//         Container(
//           width: 200,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5F5F5),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               NumberPicker(
//                 minValue: 0,
//                 maxValue: 12,
//                 value: hour,
//                 infiniteLoop: true,
//                 itemHeight: 60,
//                 itemWidth: 80,
//                 textStyle: const TextStyle(color: Colors.grey),
//                 selectedTextStyle: const TextStyle(
//                     color: Color.fromARGB(255, 28, 67, 30), fontSize: 15),
//                 onChanged: ((value) {
//                   setState(() {
//                     hour = value;
//                   });
//                 }),
//               ),
//               NumberPicker(
//                 minValue: 0,
//                 maxValue: 59,
//                 value: minute,
//                 zeroPad: true,
//                 infiniteLoop: true,
//                 itemHeight: 60,
//                 itemWidth: 80,
//                 textStyle: const TextStyle(color: Colors.grey),
//                 selectedTextStyle: const TextStyle(
//                     color: Color.fromARGB(255, 28, 67, 30), fontSize: 15),
//                 onChanged: ((value) {
//                   setState(() {
//                     minute = value;
//                   });
//                 }),
//               ),
//             ],
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Checkbox(
//                 activeColor: const Color.fromARGB(255, 28, 67, 30),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(2)),
//                 value: this.value ?? false,
//                 onChanged: (value) {
//                   setState(() {
//                     this.value = value;
//                   });
//                 }),
//             const Text(
//               'Receive watering reminders',
//               style: TextStyle(color: Color(0xFF676767)),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: SizedBox(
//             width: 250,
//             child: FloatingActionButton(
//               onPressed: null,
//               backgroundColor: const Color.fromARGB(255, 28, 67, 30),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50)),
//               child: const Text(
//                 'Add Plant',
//                 style: TextStyle(
//                     color: Colors.white,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: SizedBox(
//             width: 250,
//             child: FloatingActionButton(
//               onPressed: null,
//               backgroundColor: const Color(0xFFF5F5F5),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50)),
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(
//                     color: Color(0xFFB8B8B8),
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }