// Import necessary packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plant.dart'; // Ensure this is correctly pointing to your Plant model
import 'edit_plant.dart'; // Import EditPlantScreen
import 'information.dart'; // Import InformationScreen

class PlantStatusScreen extends StatefulWidget {
  final Plant plant;

  const PlantStatusScreen({required this.plant});

  @override
  _PlantStatusScreenState createState() => _PlantStatusScreenState();
}

class _PlantStatusScreenState extends State<PlantStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plant.name), // Use plant name as the title
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InformationScreen(plantName: widget.plant.name),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Watering Schedule: ${widget.plant.wateringSchedule}', // Use plant's watering schedule
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Next Reminder: ${DateFormat('yyyy-MM-dd').format(widget.plant.reminder)}', // Use formatted plant's reminder date
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPlantScreen(plant: widget.plant),
                  ),
                ).then((updatedPlant) {
                  // Handle the returned updated plant
                  if (updatedPlant != null) {
                    setState(() {
                      // Update plant properties
                      widget.plant.name = updatedPlant.name;
                      widget.plant.wateringSchedule =
                          updatedPlant.wateringSchedule;
                      widget.plant.reminder = updatedPlant.reminder;
                      widget.plant.enteredPlantName =
                          updatedPlant.enteredPlantName;
                    });
                  }
                });
              },
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// //import 'package:share_plus/share_plus.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'SPROUT',
//             style: TextStyle(
//                 letterSpacing: 10,
//                 fontSize: 40,
//                 color: Color.fromARGB(255, 28, 67, 30)),
//           ),
//           centerTitle: true,
//           toolbarHeight: 120,
//         ),
//         body: const PlantScreen(),
//       ),
//     );
//   }
// }

// class PlantScreen extends StatefulWidget {
//   const PlantScreen({super.key});

//   @override
//   State<PlantScreen> createState() => _PlantScreenState();
// }

// class _PlantScreenState extends State<PlantScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: Image.asset('assets/images/peony.png')),
//             const Padding(
//               padding: EdgeInsets.only(top: 15.0),
//               child: Text('Plant 1'),
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
//                   child: SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: Image.asset('assets/images/brownleaf.png'),
//                   ),
//                 ),
//                 const Text('Plant\'s Health'),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15.0),
//               child: Container(
//                 width: 280,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xFFF3F3F3)),
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0xFFF3F3F3),
//                       blurRadius: 3,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 70.0),
//               child: SizedBox(
//                 width: 250,
//                 child: FloatingActionButton(
//                   onPressed: null,
//                   backgroundColor: const Color.fromARGB(255, 28, 67, 30),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: const Text(
//                     'Edit',
//                     style: TextStyle(
//                         color: Colors.white,
//                         letterSpacing: 1,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }