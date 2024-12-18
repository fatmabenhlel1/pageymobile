import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Book model class
class Book {
  final String imagePath;
  final String title;
  final String genre;

  Book({
    required this.imagePath,
    required this.title,
    required this.genre,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      imagePath: json['imagePath'] ?? '', // Default empty string if key is missing
      title: json['title'] ?? '', // Default empty string if key is missing
      genre: json['genre'] ?? '', // Default empty string if key is missing
    );
  }
}

// BookProfile Page to display book details
class BookProfile extends StatelessWidget {
  final Book book;

  const BookProfile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Genre: ${book.genre}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class BookGrid extends StatefulWidget {
  const BookGrid({Key? key}) : super(key: key);

  @override
  State<BookGrid> createState() => _BookGridState();
}

class _BookGridState extends State<BookGrid> {
  late Future<List<Book>> futureBooks;

  // Fetch book data from the API
  Future<List<Book>> fetchBooks() async {
    const url = 'https://999b-196-203-181-122.ngrok-free.app/api/books'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Book.fromJson(json)).toList();
      } catch (e) {
        throw Exception('Invalid JSON format');
      }
    } else {
      throw Exception('Failed to load books. Status Code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 11),
      child: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books available'));
          }

          final books = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: books.map((book) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to BookProfile when the book is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookProfile(book: book),
                          ),
                        );
                      },
                      child: BookCard(
                        imagePath: book.imagePath,
                        title: book.title,
                        genre: book.genre,
                        book: book,  // Pass the book object to BookCard
                      ),
                    ),
                    const SizedBox(width: 34),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String genre;
  final Book book;  // Add book as a parameter

  const BookCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.genre,
    required this.book,  // Pass the book object to the BookCard
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D06070D),
                  blurRadius: 14,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: imagePath.isNotEmpty
                  ? Image.asset(
                      imagePath,  // Correct way to load asset images
                      width: 160,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 160, color: Colors.grey), // Fallback if imagePath is empty
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF19191B),
            ),
          ),
          Text(
            genre,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9D9D9D),
            ),
          ),
        ],
      ),
    );
  }
}
