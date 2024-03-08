class Plant {
  String name;
  String iconPath;
  String wateringSchedule;
  DateTime reminder;
  String enteredPlantName; // New field

  Plant({
    required this.name,
    required this.iconPath,
    required this.wateringSchedule,
    required this.reminder,
    required this.enteredPlantName,
  });

  // Setter method for updating enteredPlantName
  void setEnteredPlantName(String newName) {
    enteredPlantName = newName;
  }
}
