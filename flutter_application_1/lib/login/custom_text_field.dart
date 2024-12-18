import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final bool isPassword;
  final bool? isPasswordVisible;
  final VoidCallback? onVisibilityToggle;
  final TextInputType textInputType;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.isPassword = false,
    this.isPasswordVisible,
    this.onVisibilityToggle,
    this.textInputType = TextInputType.text, required TextEditingController controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),
            if (isPassword)
              TextButton.icon(
                onPressed: onVisibilityToggle,
                icon: Icon(
                  isPasswordVisible ?? false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color(0xFF666666),
                ),
                label: Text(
                  isPasswordVisible ?? false ? 'Hide' : 'Show',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: isPassword && !(isPasswordVisible ?? false),
          keyboardType: textInputType,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0x59666666),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0x59666666),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}