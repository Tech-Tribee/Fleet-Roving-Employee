// ignore_for_file: library_private_types_in_public_api

import 'package:fleet_roving_employee/commons/contants/widgets/reusable_button.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/utils.dart';
import 'package:fleet_roving_employee/features/home/screens/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNightMode = true;
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  _loadUserName() async {
    userName = await SharedPref.getUserName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNightMode ? Colors.black : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: isNightMode ? Colors.black : Colors.blue,
            elevation: 0,
            actions: [
              Row(
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isNightMode = !isNightMode;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xff333333),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Row(
                          children: [
                            isNightMode
                                ? Icon(
                                    Icons.wb_sunny_outlined,
                                    color: isNightMode
                                        ? Colors.white
                                        : Colors.black,
                                  )
                                : const Spacer(),
                            isNightMode
                                ? const SizedBox()
                                : Icon(
                                    Icons.brightness_2_sharp,
                                    color: isNightMode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 60,
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent.withOpacity(0.2),
                child: DrawerWidget(
                  userName: userName ?? "Guest",
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HEY ${userName!.toUpperCase()},",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 1),
                const Text(
                  "WELCOME BACK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/cloud.avif",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "GET STARTED WITH AN AMAZING commute.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableButtonConatiner(
                      text: "SCHEDULE A TRIP",
                    ),
                    ReusableButtonConatiner(
                      text: "CURRENT STATUS",
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 50,
            color: Colors.white,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
