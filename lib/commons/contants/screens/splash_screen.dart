import 'dart:async';

import 'package:fleet_roving_employee/commons/colors.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/utils.dart';
import 'package:fleet_roving_employee/features/authentication/screens/login_screen.dart';
import 'package:fleet_roving_employee/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isSignIn = false;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.7, 0),
    end: const Offset(-0.3, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    _controller.forward();
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              _isSignIn ? const HomeScreen() : const LoginScreen(),
        ),
      );
    });
  }

  getUserLoggedInStatus() async {
    await SharedPref.getUserLoggedInStatus().then((value) => {
          if (value != null)
            {
              setState(() {
                _isSignIn = value;
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              GlobalVariable.splashScreenPrimaryColor,
              GlobalVariable.splashScreenSecondaryLightColor,
            ],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: SizedBox(
                  width: 150,
                  height: 180,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65, left: 72),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    "OVING",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: "splashscreenfont",
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
