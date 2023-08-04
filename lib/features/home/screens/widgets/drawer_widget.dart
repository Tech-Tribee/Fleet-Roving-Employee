import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  final String userName;
  const DrawerWidget({super.key, required this.userName});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.userName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "EMPLOYEE ID: 746937",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "AMAZON INDIA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 40,
          thickness: 3,
        ),
        const SizedBox(height: 25),
        const Text(
          "Contact Fleet Desk",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Weekly Off's",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Upcoming Events",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Progress",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Your Rewards",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 120,
          thickness: 3,
        ),
        const SizedBox(height: 10),
        const Text(
          "Need Help?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
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
