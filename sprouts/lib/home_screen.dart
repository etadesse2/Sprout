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
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'SPROUT',
          style: TextStyle(
              letterSpacing: 10,
              fontSize: 40,
              color: Color.fromARGB(255, 28, 67, 30)),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'My Plants',
                style: TextStyle(fontSize: 20, color: Color(0xFF676767)),
              ),
            )),
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
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 28, 67, 30),
        onPressed: () => _navigateAndDisplaySelection(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
      splashColor: null,
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
