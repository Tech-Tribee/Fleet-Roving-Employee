import 'package:flutter/material.dart';

class ReusableButtonConatiner extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color color;
  final double fontSize;
  const ReusableButtonConatiner({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        color: color,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
