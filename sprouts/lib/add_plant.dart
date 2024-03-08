import 'package:flutter/material.dart';
import 'plant.dart';

class AddPlantScreen extends StatefulWidget {
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlant;
  String _enteredPlantName =
      ''; // Use this variable to store the entered plant name
  String _wateringSchedule = '';
  DateTime _selectedDate = DateTime.now();

  final Map<String, String> plantNamesAndIcons = {
    "Tulip": "assets/images/tulip.png",
    "Peony": "assets/images/peony.png",
  };

  TextEditingController _plantNameController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'SPROUT',
          style: TextStyle(
            letterSpacing: 10,
            fontSize: 40,
            color: Color.fromARGB(255, 28, 67, 30),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 15),
              child: TextField(
                controller: _plantNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Plant Name',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 28, 67, 30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _enteredPlantName = value;
                  });
                },
              ),
            ),
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Watering Schedule'),
              onChanged: (value) {
                setState(() {
                  _wateringSchedule = value;
                });
              },
            ),
            ListTile(
              title: Text('Select Reminder Date'),
              subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
              onTap: () => _selectDate(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
              child: SizedBox(
                width: 250,
                child: FloatingActionButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Plant newPlant = Plant(
                        name: _selectedPlant ?? _enteredPlantName,
                        iconPath: plantNamesAndIcons[_selectedPlant] ?? '',
                        wateringSchedule: _wateringSchedule,
                        reminder: _selectedDate,
                        enteredPlantName: _enteredPlantName,
                      );
                      Navigator.pop(context, newPlant);
                    }
                  },
                  backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Add Plant',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
              child: SizedBox(
                width: 250,
                child: FloatingActionButton(
                  onPressed: null,
                  backgroundColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFFB8B8B8),
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