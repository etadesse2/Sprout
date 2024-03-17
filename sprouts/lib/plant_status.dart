import 'package:flutter/material.dart';
import 'package:sprouts/information.dart';
import 'plant.dart';
import 'edit_plant.dart';

class PlantStatusScreen extends StatelessWidget {
  final Plant selectedPlant;

  const PlantStatusScreen({super.key, required this.selectedPlant});

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationScreen(
                              plantName: selectedPlant.plantType)));
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: Color.fromARGB(255, 28, 67, 30),
                )),
          )
        ],
      ),
      body: PlantScreen(plant: selectedPlant),
    );
  }
}

class PlantScreen extends StatefulWidget {
  final Plant plant;

  const PlantScreen({super.key, required this.plant});

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
          ],
        ),
      ),
    );
  }

  void updatePlant() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPlantScreen(plant: currentPlant),
      ),
    );

    if (result == 'remove') {
      // Just pop with 'remove' to tell HomeScreen to remove the plant
      Navigator.pop(context, 'remove');
    } else if (result is Plant) {
      // Update the plant in the current screen and pass the updated plant back to HomeScreen
      setState(() {
        currentPlant = result;
      });
      Navigator.pop(context, result); // Pass the updated plant back
    }
  }
}
