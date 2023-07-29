import 'package:fleet_roving_employee/commons/contants/widgets/custom_button.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/custom_text_field.dart';
import 'package:fleet_roving_employee/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void handlesubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Sign in to continue.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                controller: nameController,
                hintText: "Name",
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "sign up",
                onPressed: handlesubmit,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/logo.png",
                height: 150,
                width: 100,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
