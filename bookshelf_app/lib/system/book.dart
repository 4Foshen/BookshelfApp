class Book {
  final int id;
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
    required this.id,
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

class Library {
  static final List<Book> _books = [
    Book(
      id: 0,
      bookName: "451 Градус по фаренгейту",
      author: "Рей Бредберри",
      description:
          "«451 градус по Фаренгейту» — научно-фантастический роман-антиутопия Рэя Брэдбери, изданный в 1953 году. Роман описывает американское общество близкого будущего, в котором книги находятся под запретом. «Пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают любые найденные книги.\nВ ходе романа Монтэг разочаровывается в идеалах общества, частью которого он является, становится изгоем и присоединяется к небольшой подпольной группе маргиналов, сторонники которой заучивают тексты книг, чтобы спасти их для потомков.",
      genre: "Роман",
      term: "29.10.2024",
      imagePath: "assets/img/book.png",
      rating: 4.5,
      isAvailable: true,
      isAwaiting: false,
      isReady: true,
    ),
    Book(
      id: 1,
      bookName: "Дюна",
      author: "Фрэнк Гербертс",
      description: "Описание",
      genre: "Фантастика",
      term: "12.11.2024",
      imagePath: "assets/img/book.png",
      rating: 4.7,
      isAvailable: true,
      isAwaiting: true,
      isReady: false,
    ),
  ];

  static final List<Book> _cart = [];
  static final List<Book> _orders = [];
  static final List<Book> _ownedBooks = [];

  static List<Book> get books => _books;
  static List<Book> get cart => _cart;
  static List<Book> get orders => _orders;
  static List<Book> get ownedBooks => _ownedBooks;


  //ADD METHODS FOR ADDING TO ORDER AND ADDING TO OWNED


  static void addToCart(Book book) {
    if (!_cart.contains(book) && !_orders.contains(book)) {
      _cart.add(book);
    } else {
      print("Эта книга уже в корзине.");
    }
  }

  static void addToOrders(){
    if(_cart.isNotEmpty){
      _orders.addAll(_cart);
      _cart.clear();
    }
  }

  //ADDING TO OWNED IS GOING TO BE ON BACKEND

  static void removeFromCart(Book book) {
    _cart.remove(book);
  }

  static void clearCart() {
    _cart.clear();
  }

  static Book? findBookById(int id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }
}
