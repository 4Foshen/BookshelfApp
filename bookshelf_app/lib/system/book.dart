class Book {
  final String bookName;
  final String author;
  final String description;
  final String genre;
  final String term;
  final String imagePath; //Change afterBackend
  final double rating;
  //final bool isLiked;
  final bool isAvailable;
  final bool isAwaiting;
  final bool isReady;

  Book({
    required this.bookName,
    required this.author,
    required this.description,
    required this.genre,
    required this.term,
    required this.imagePath,
    required this.rating,
    required this.isAvailable,
    required this.isAwaiting,
    required this.isReady,
  });
}
