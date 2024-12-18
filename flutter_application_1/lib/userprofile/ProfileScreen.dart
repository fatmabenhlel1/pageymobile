import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
        title: Text(
          'Pagey',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Profile action
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile1.png'), // Replace with your image asset
              ),
              SizedBox(height: 8),
              Text(
                'foulen weld elfouleni',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'foulen.fouleni@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              _buildTextField('Full Name', 'Your First Name'),
              _buildTextField('User Name', 'Your First Name'),
              _buildTextField('Country', 'Your First Name'),
              _buildTextField('Gender', 'Your First Name'),
              _buildTextField('Age', ''),
              _buildTextField('My Email Address', 'Your Email', suffixIcon: Icons.edit),
              _buildTextField('Languages', '', suffixIcon: Icons.add),
              SizedBox(height: 24),
              _buildSectionTitle('Last visited'),
              _buildBookCarousel([
                'assets/images/CR.png',
                'assets/images/rd.jpg',
              ], [
                'Catcher in the Rye',
                'Someone Like You',
              ]),
              SizedBox(height: 24),
              _buildSectionTitle('New Arrivals'),
              _buildBookCarousel([
                'assets/images/lor.jpg',
                'assets/images/CR.png',
              ], [
                'My Sister\'s Keeper',
                'Great Expectations',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBookCarousel(List<String> imagePaths, List<String> titles) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Image.asset(
                  imagePaths[index],
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
