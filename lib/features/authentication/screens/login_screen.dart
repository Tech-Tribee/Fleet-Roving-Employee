import 'package:fleet_roving_employee/commons/contants/widgets/custom_button.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/custom_text_field.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/show_snackbar.dart';
import 'package:fleet_roving_employee/features/authentication/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void handlesubmit() {
    String userName = nameController.text.trim();
    String password = passwordController.text.trim();

    if (userName.isNotEmpty && password.isNotEmpty) {
      ref.read(authControllerProvider).signup(
            context,
            userName,
            password,
          );
    } else {
      showSnackBar(context, "Enter valid information for login, Please!");
    }
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
          child: SingleChildScrollView(
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
                  controller: passwordController,
                  hintText: "Password",
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Log in",
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
      ),
    ));
  }
}
