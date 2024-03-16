import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plant.dart'; // Ensure this is correctly pointing to your Plant model
import 'edit_plant.dart'; // Import EditPlantScreen
import 'information.dart'; // Import InformationScreen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: PlantScreen(),
      ),
    );
  }
}

class PlantScreen extends StatefulWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  String wateringSchedule = 'Water every day';
  String reminderMessage = 'Reminder message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/images/peony.png')),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Plant 1'),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/brownleaf.png'),
                  ),
                ),
                const Text('Plant\'s Health'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: 280,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF3F3F3)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFF3F3F3),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Watering Schedule: $wateringSchedule'),
                    const SizedBox(height: 10),
                    Text('Next Reminder: $reminderMessage'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPlantScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400),
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

class EditPlantScreen extends StatelessWidget {
  const EditPlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Plant'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add functionality for editing the plant
          },
          child: const Text('Save Changes'),
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