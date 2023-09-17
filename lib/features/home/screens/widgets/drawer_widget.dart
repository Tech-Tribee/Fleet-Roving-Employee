import 'package:fleet_roving_employee/features/authentication/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerWidget extends ConsumerWidget {
  final String userName;

  const DrawerWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);

    void logout() {
      authController.logout(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
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
        const SizedBox(height: 15),
        InkWell(
          onTap: logout,
          child: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
