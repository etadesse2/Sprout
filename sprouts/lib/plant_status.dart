import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plant.dart';
import 'edit_plant.dart';
import 'information.dart';

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
        title: Text(widget.plant.name),
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
              'Watering Schedule: ${widget.plant.wateringSchedule}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Next Reminder: ${DateFormat('yyyy-MM-dd').format(widget.plant.reminder)}',
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
