import 'package:flutter/material.dart';
import 'add_plant.dart';
import 'plant_status.dart';
import 'plant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plant> plants = [];

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPlantScreen()),
    );

    if (result != null && result is Plant) {
      setState(() {
        plants.add(result);
      });
    }
  }

  void _navigateToPlantStatusScreen(
      BuildContext context, Plant selectedPlant, int index) async {
    final updatedPlant = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantStatusScreen(selectedPlant: selectedPlant),
      ),
    );

    if (updatedPlant != null) {
      setState(() {
        plants[index] = updatedPlant as Plant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Plants'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return GestureDetector(
            onTap: () => _navigateToPlantStatusScreen(context, plant, index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularImageButton(
                  imagePath: plant.iconPath,
                  onPressed: () =>
                      _navigateToPlantStatusScreen(context, plant, index),
                ),
                Text(
                  plant.enteredPlantName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndDisplaySelection(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CircularImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const CircularImageButton({
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
