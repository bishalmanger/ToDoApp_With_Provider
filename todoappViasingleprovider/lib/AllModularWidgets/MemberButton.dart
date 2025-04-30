import 'package:flutter/material.dart';

class MemberButton extends StatelessWidget {
  final Text text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final IconData? icon;
  final VoidCallback callBack;

  MemberButton({
    required this.text,
    required this.backgroundColor,
    this.textStyle,
    this.icon,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: callBack, // Call directly since it's already a callback
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              padding: EdgeInsets.all(10)
          ),
          child: icon != null
              ? Row(
            children: [
              Icon(icon),
              text
            ],
          ): text // Handle null text case
        ),
      ),
    );
  }
}
