import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              // Bookmark action
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(231, 235, 239, 0.73),
              Color.fromRGBO(247, 236, 207, 0.73),
              Color.fromRGBO(246, 235, 207, 0.73),
            ],
            stops: [0.154, 0.509, 0.829],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/CR.png', // Replace with your local image path
                  height: 200,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Catcher in the Rye',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'J.D. Salinger',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'About the author',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945-1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation, and as a critique...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to preview
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Text('Read Previews'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Buy action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Text('Buy for \$14.05'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
