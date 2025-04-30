import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? inputController;
  final TextInputType? inputType;
  final String? hintText;
  final TextStyle? textStyle;
  final IconData icon;

  CustomTextFieldWidget({
    this.inputController,
    this.inputType,
    this.hintText,
    this.textStyle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          controller: inputController,
          keyboardType: inputType,
          style: textStyle, // Add text style if provided
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon), // Use the icon property here
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blueAccent, width: 4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 4),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
