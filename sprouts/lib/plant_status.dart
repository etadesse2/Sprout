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
                      widget.plant.name = updatedPlant.name;
                      widget.plant.wateringSchedule =
                          updatedPlant.wateringSchedule;
                      widget.plant.reminder = updatedPlant.reminder;
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
