class Plant {
  String name;
  String iconPath;
  String wateringSchedule;
  DateTime? reminder; // Nullable DateTime
  String enteredPlantName; // New field
  String? reminderMessage; // Nullable String
  String plantType; // New field

  Plant({
    required this.name,
    required this.iconPath,
    required this.wateringSchedule,
    this.reminder, // Nullable DateTime
    required this.enteredPlantName,
    this.reminderMessage, // Nullable String
    required this.plantType, // New field
  });

  // Setter method for updating enteredPlantName
  void setEnteredPlantName(String newName) {
    enteredPlantName = newName;
  }
}
