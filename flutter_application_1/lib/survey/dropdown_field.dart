import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final bool showLabel;

  const DropdownField({
    Key? key,
    required this.label,
    required this.hint,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12), // Adjust vertical spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel)
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          const SizedBox(height: 8), // Space between label and dropdown
          Container(
            width: double.infinity, // Full width for mobile responsiveness
            height: 48, // Increased height for better touch targets
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFD9D9D9)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hint,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, size: 18), // Slightly larger icon
              ],
            ),
          ),
        ],
      ),
    );
  }
}
