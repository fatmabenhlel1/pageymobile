import 'package:flutter/material.dart';
import '../userprofile/ProfileScreen.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'images/menu-svgrepo-com.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 10),
              const Text(
                'Pagey',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Outfit',
                ),
              ),
            ],
          ),
          ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: CircleBorder(),
    padding: EdgeInsets.all(0), // No padding to make the button circular
    backgroundColor: Colors.transparent, // Make the background transparent
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  },
  child: const CircleAvatar(
    radius: 20,
    backgroundImage: AssetImage('assets/images/profile1.png'),
  ),
)

        ],
      ),
    );
  }
}