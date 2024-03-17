import 'package:flutter/material.dart';
import 'package:sprouts/information.dart';
import 'plant.dart';
import 'edit_plant.dart';

class PlantStatusScreen extends StatelessWidget {
  final Plant selectedPlant;

  const PlantStatusScreen({Key? key, required this.selectedPlant})
      : super(key: key);

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
            color: Color.fromARGB(255, 28, 67, 30),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: PlantScreen(plant: selectedPlant),
    );
  }
}

class PlantScreen extends StatefulWidget {
  final Plant plant;

  const PlantScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  late Plant currentPlant;
  int yesCount = 0;
  int noCount = 0;
  void yesIncr() {
    setState(() {
      yesCount++;
    });
  }

  void noIncr() {
    setState(() {
      noCount++;
    });
  }

  @override
  void initState() {
    super.initState();
    currentPlant = widget.plant;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset(currentPlant.iconPath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15),
              child: Text(currentPlant.name),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
            //   child: SizedBox(
            //     width: 100,
            //     height: 100,
            //     child: Image.asset('assets/images/brownleaf.png'),
            //   ),
            // ),
            //const Text('Plant\'s Health'),
            if (noCount > yesCount * 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/leafbrown.png')),
              ),
            if (!(noCount > yesCount * 2))
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/leaf.png')),
              ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 20),
              child: Text('Plant\'s Health'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text('Did you water ${currentPlant.name}?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: noIncr,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8B8B8),
                      ),
                      child: const Text('No',
                          style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: yesIncr,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            if (noCount > yesCount * 2)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFFFDE68),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                            'Your plant is under critical condition. For  more information on , check the info page.'),
                      ),
                    ],
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text('Watering Schedule'),
            ),
            Text(currentPlant.wateringSchedule),
            const SizedBox(height: 10),
            Text('Next Reminder: ${currentPlant.reminderMessage}'),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: updatePlant,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 28, 67, 30),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.ios_share_rounded,
                  color: Color.fromARGB(255, 28, 67, 30),
                )),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15.0),
            //   child: Container(
            //     width: 280,
            //     height: 100,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: const Color(0xFFF3F3F3)),
            //       color: const Color.fromARGB(255, 255, 255, 255),
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Color(0xFFF3F3F3),
            //           blurRadius: 3,
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text('Watering Schedule: ${currentPlant.wateringSchedule}'),
            //         const SizedBox(height: 10),
            //         Text('Next Reminder: ${currentPlant.reminderMessage}'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void updatePlant() async {
    final updatedPlant = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPlantScreen(plant: currentPlant),
      ),
    );

    if (updatedPlant != null) {
      setState(() {
        currentPlant = updatedPlant as Plant;
      });
    }
  }
}

// void shareSchedule() {
//   String scheduleShare =
//       'Hey there! This is Person\'s Name watering schedule for Plant Name';
//   //Share.share(scheduleShare);
// }
