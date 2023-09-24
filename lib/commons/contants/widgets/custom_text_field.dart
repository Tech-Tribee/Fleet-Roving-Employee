import 'package:fleet_roving_employee/commons/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hidden;
  final Color color;
  final Color textColor;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.hidden = false,
      this.color = GlobalVariable.textFildBackGroundColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidden,
      controller: controller,
      style: TextStyle(color: textColor), // Set the text color to white
      decoration: InputDecoration(
        filled: true,
        label: Text(
          hintText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        fillColor: color,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
      ),
    );
  }
}
