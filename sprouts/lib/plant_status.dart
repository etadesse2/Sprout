import 'package:flutter/material.dart';
import 'plant.dart';
import 'edit_plant.dart'; // Ensure this is the correct path to your EditPlantScreen

class PlantStatusScreen extends StatelessWidget {
  final Plant plant;

  PlantStatusScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPlantScreen(plant: plant)),
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
            Center(
              child: Image.asset(
                plant.iconPath, // Assuming this is a valid path
                width: 100,
                height: 100,
              ),
            ),
            Text(
              'Watering Schedule: ${plant.wateringSchedule}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Next Reminder: ${plant.reminder.toString()}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
