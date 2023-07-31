import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "JOHN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "EMPLOYEE ID: 746937",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "AMAZON INDIA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Divider(
          color: Colors.white,
          height: 40,
          thickness: 3,
        ),
        SizedBox(height: 25),
        Text(
          "Contact Fleet Desk",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Weekly Off's",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Upcoming Events",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Progress",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Your Rewards",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Divider(
          color: Colors.white,
          height: 120,
          thickness: 3,
        ),
        SizedBox(height: 10),
        Text(
          "Need Help?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Rate Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
