Map<String, Map<String, dynamic>> library = {};

void addBook({
  required String title,
  String author = "ghaith",
  String genre = "since",
  String year = "2000",
}) {
  library[title] = {"author": author, "genre": genre, "year": year};
  print("Book added successfully");
}

String getBookInfo({required String title}) {
  if (library.containsKey(title)) {
    var book = library[title]!;
    return "Title: $title\nAuthor: ${book['author']}\nYear: ${book['year']}\nGenre: ${book['genre']}";
  }
  return "Book not found.";
}

void listAllBooks({String genre = ""}) {
  if (library.isEmpty) {
    print("No books in the library.");
    return;
  }

  String displayTitle = genre.isEmpty ? "All Books:" : "Books in Genre: $genre";
  print(displayTitle);

  library.forEach((title, details) {
    if (genre.isEmpty || details['genre'] == genre) {
      print("- $title");
    }
  });
}

List<String> listBooksByGenre({required String genre}) {
  List<String> books = [];

  for (var title in library.keys) {
    if (library[title]!['genre'] == genre) {
      books.add(title);
    }
  }

  return books.isEmpty ? ["No books found for this genre."] : books;
}

String removeBook({required String title}) {
  if (library.containsKey(title)) {
    library.remove(title);
    return "Book removed successfully: $title";
  }
  return "Book not found.";
}

void main() {
  addBook(
    title: "1984",
    author: "George Orwell",
    genre: "Dystopian",
    year: "1949",
  );
  addBook(
    title: "1984",
    author: "George Orwell",
    genre: "Dystopian",
    year: "1949",
  );

  addBook(
    title: "الأمير",
    author: "نيكولو ميكيافيللي",
    genre: "سياسة",
    year: "1532",
  );

  addBook(
    title: "حكاية مدينة",
    author: "تشارلز ديكنز",
    genre: "رواية",
    year: "1859",
  );

  addBook(
    title: "موسم الهجرة إلى الشمال",
    author: "الطيب صالح",
    genre: "رواية",
    year: "1966",
  );

  String test = "Dystopian";
  listAllBooks(genre: test);
  print(getBookInfo(title: "55"));
}
