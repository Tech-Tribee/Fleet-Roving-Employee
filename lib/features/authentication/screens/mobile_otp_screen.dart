import 'package:fleet_roving_employee/commons/contants/widgets/custom_button.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/custom_text_field.dart';
import 'package:fleet_roving_employee/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 4.5,
            colors: [
              Colors.black,
              Color(0xff032261),
              Color(0xff079697),
            ],
            stops: [0.28, 0.35, 0.45],
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Enter the 4-digit code sent to you at xxxx-xxx-xxx.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: otpContorller,
              hintText: "",
              color: Colors.white,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Proceed",
              textColor: const Color(0xff0C9944),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Tip: Make sure to check your inbox and spam folders",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Resend",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Facing an issue?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
