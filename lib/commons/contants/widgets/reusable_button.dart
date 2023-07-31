import 'package:flutter/material.dart';

class ReusableButtonConatiner extends StatelessWidget {
  final String text;
  const ReusableButtonConatiner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 150,
      color: Colors.white,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
