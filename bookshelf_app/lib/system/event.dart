class Event {
  final String eventName;
  final String description;
  final String imagePath;
  final String date;
  final String adress;
  
  Event({
    required this.eventName,
    required this.description,
    required this.imagePath,
    required this.date,
    this.adress = "",
  });
}
