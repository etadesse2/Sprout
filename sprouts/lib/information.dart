import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class InformationScreen extends StatefulWidget {
  final String plantName;

  InformationScreen({required this.plantName});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late Future<String> _plantInformation;

  @override
  void initState() {
    super.initState();
    _plantInformation = loadPlantInformation(widget.plantName);
  }

  Future<String> loadPlantInformation(String plantName) async {
    return await rootBundle.loadString('assets/$plantName.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Information'),
      ),
      body: FutureBuilder<String>(
        future: _plantInformation,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(
                snapshot.data ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
