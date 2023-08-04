import 'package:fleet_roving_employee/commons/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: GlobalVariable.splashScreenPrimaryColor,
    ),
  );
}
