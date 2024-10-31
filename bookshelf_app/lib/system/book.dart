class Book {
  final String bookName;
  final String author;
  final String description;
  final String genre;
  //Change to smth
  final String imagePath;
  final double rating;
  final bool isAvailable;
  final bool isAwaiting;

  Book({
    required this.bookName,
    required this.author,
    required this.description,
    required this.genre,
    required this.imagePath,
    required this.rating,
    required this.isAvailable,
    required this.isAwaiting,
  });
}
