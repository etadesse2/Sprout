import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sprouts/plant_status.dart';

class InformationScreen extends StatefulWidget {
  final String plantName;

  const InformationScreen({super.key, required this.plantName});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  int selectedIndex = 1; // Set the index to 1 (Info) to make it active

  Widget _buildPlantInfo(String plantName) {
    switch (plantName) {
      case 'Plant 1':
        return const Info(
          plantName: 'Peony',
          imgPath: 'assets/images/peony.png',
          generalInfo:
              'Transform your garden into a paradise with our expert tips on growing peonies! These enchanting flowers thrive in well-drained, fertile soil with plenty of sunlight, ideally receiving at least 6 hours of direct sunlight per day. Plant them in a location with good air circulation to prevent diseases and ensure healthy growth. With proper care and the right conditions, you\'ll enjoy a bountiful display of peony blooms year after year, making your garden the envy of the neighborhood!',
          wateringTip:
              'Water peonies deeply once a week, adjusting based on weather conditions and soil moisture levels to maintain consistent moisture without waterlogging.',
          sunTip:
              'Ensure peonies receive at least 6 hours of direct sunlight daily for optimal growth and abundant blooms.',
          health:
              'Monitor for signs of fungal diseases such as botrytis or powdery mildew, especially during humid weather.',
          diseaseInfo:
              'Peonies, beloved for their beautiful blooms, can be susceptible to a few common diseases. Some of the diseases that affect peonies include:',
          disease1:
              'Botrytis Blight (Gray Mold): This fungal disease causes brown spots on leaves and stems, as well as gray mold on affected areas. It often thrives in cool, wet conditions.',
          disease2:
              'Powdery Mildew: Powdery mildew is a fungal disease characterized by white, powdery spots on leaves, stems, and sometimes flowers. It typically occurs in warm, humid environments.',
          disease3:
              'Leaf Spot: Leaf spot diseases, caused by various fungi, bacteria, or environmental stressors, result in dark spots or lesions on the leaves of peonies. These spots may vary in color and size.',
          disease4:
              'Verticillium Wilt: This soilborne fungal disease affects the vascular system of peonies, causing wilting, yellowing, and browning of foliage. It can lead to plant decline or death.',
          disease5:
              'Root Rot: Excessive moisture in the soil can lead to root rot in peonies, caused by various fungal pathogens. Symptoms include yellowing foliage, wilting, and decayed roots.',
          disease6:
              'Stem Rots: Several fungal pathogens can cause stem rots in peonies, resulting in dark, water-soaked lesions on stems and eventual wilting and collapse of affected stems.',
        );
      case 'Plant 2':
        return const Info(
          plantName: 'Tulip',
          imgPath: 'assets/images/tulip.png',
          generalInfo:
              'Transform your garden into a paradise with our expert tips on growing tulips! These enchanting flowers thrive in well-drained, fertile soil with plenty of sunlight, ideally receiving at least 6 hours of direct sunlight per day. Plant them in a location with good air circulation to prevent diseases and ensure healthy growth. With proper care and the right conditions, you\'ll enjoy a bountiful display of tulip blooms year after year, making your garden the envy of the neighborhood!',
          wateringTip:
              'Water tulips deeply once a week, adjusting based on weather conditions and soil moisture levels to maintain consistent moisture without waterlogging.',
          sunTip:
              'Ensure tulips receive at least 6 hours of direct sunlight daily for optimal growth and abundant blooms.',
          health:
              'Monitor for signs of fungal diseases such as tulip fire or botrytis blight, especially during humid weather.',
          diseaseInfo:
              'Tulips, beloved for their beautiful blooms, can be susceptible to a few common diseases. Some of the diseases that affect tulips include:',
          disease1:
              'Tulip Fire: This fungal disease causes distorted, discolored foliage and flowers, often with black spots or streaks. It spreads rapidly in moist conditions.',
          disease2:
              'Botrytis Blight (Gray Mold): This fungal disease causes brown spots on leaves and stems, as well as gray mold on affected areas. It often thrives in cool, wet conditions.',
          disease3:
              'Tulip Breaking Virus: This viral disease results in streaks or mottling of colors in tulip petals, leading to distorted or "broken" flowers. It can spread through infected bulbs.',
          disease4:
              'Root Rot: Excessive moisture in the soil can lead to root rot in tulips, caused by various fungal pathogens. Symptoms include yellowing foliage, wilting, and decayed roots.',
          disease5:
              'Stem Rots: Several fungal pathogens can cause stem rots in tulips, resulting in dark, water-soaked lesions on stems and eventual wilting and collapse of affected stems.',
          disease6:
              'Bulb Rot: Improper storage or planting conditions can lead to bulb rot in tulips, characterized by soft, mushy bulbs and foul odor. This can be caused by various fungal and bacterial pathogens.',
        );
      default:
        // Return a default widget or handle the case where plantName is not recognized
        return const SizedBox(); // You can return an empty SizedBox or an error widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            if (index == 0) {
              Navigator.pop(context); // Navigate back to the previous screen
            }
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 28, 67, 30),
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 16, child: Image.asset('assets/images/leaf.png')),
            label: 'Plant',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: 'Info',
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildPlantInfo(widget.plantName),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String plantName;
  final String imgPath;
  final String generalInfo;
  final String wateringTip;
  final String sunTip;
  final String health;
  final String diseaseInfo;
  final String disease1;
  final String disease2;
  final String disease3;
  final String disease4;
  final String disease5;
  final String disease6;

  const Info({
    super.key,
    required this.plantName,
    required this.imgPath,
    required this.generalInfo,
    required this.wateringTip,
    required this.sunTip,
    required this.health,
    required this.diseaseInfo,
    required this.disease1,
    required this.disease2,
    required this.disease3,
    required this.disease4,
    required this.disease5,
    required this.disease6,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(width: 140, child: Image.asset(imgPath)),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              plantName,
              style: const TextStyle(fontSize: 20, color: Color(0xFF676767)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 30, right: 30),
            child: Text(
              generalInfo,
              style: const TextStyle(fontSize: 16, color: Color(0xFF676767)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Suggest Tips',
                style: TextStyle(fontSize: 20, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 30.0, left: 35),
            child: Row(
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  color: Color(0xFF134800),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      wateringTip,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF676767)),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 30.0, left: 35),
            child: Row(
              children: [
                const Icon(
                  Icons.wb_sunny_outlined,
                  color: Color(0xFF134800),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      sunTip,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF676767)),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 30.0, left: 35),
            child: Row(
              children: [
                const Icon(
                  Icons.health_and_safety_outlined,
                  color: Color(0xFF134800),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      health,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF676767)),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Common Diseases',
                style: TextStyle(fontSize: 20, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(diseaseInfo,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease1,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease2,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease3,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease4,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease5,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 45.0, left: 45),
            child: Text(disease6,
                style: const TextStyle(fontSize: 16, color: Color(0xFF676767))),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
