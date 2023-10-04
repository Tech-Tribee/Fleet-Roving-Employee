import 'package:flutter/material.dart';

class CabComingScreen extends StatefulWidget {
  const CabComingScreen({Key? key}) : super(key: key);

  @override
  State<CabComingScreen> createState() => _CabComingScreenState();
}

class _CabComingScreenState extends State<CabComingScreen> {
  DateTime? selectedDate;
  String selectedTime = "";
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateEndController = TextEditingController();
  TextEditingController timeEndController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = selectedDate != null
        ? "${selectedDate!.toLocal()}".split(' ')[0]
        : "Select a date";
    timeController.text =
        selectedTime.isNotEmpty ? selectedTime : "Select time";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate!.toLocal()}"
            .split(' ')[0]; // Update the text field.
      });
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateEndController.text = "${selectedDate!.toLocal()}"
            .split(' ')[0]; // Update the text field.
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    // You can implement a time picker dialog here.
    // For simplicity, I'll use a text field for demonstration.
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selected != null) {
      setState(() {
        selectedTime = "${selected.hour}:${selected.minute}";
        timeController.text = selectedTime; // Update the text field.
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    // You can implement a time picker dialog here.
    // For simplicity, I'll use a text field for demonstration.
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selected != null) {
      setState(() {
        selectedTime = "${selected.hour}:${selected.minute}";
        timeEndController.text = selectedTime; // Update the text field.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Center(
            child: Image(
              image: NetworkImage(
                "https://raw.githubusercontent.com/MindorksOpenSource/ridesharing-uber-lyft-app/master/assets/nearby-cabs.png",
              ),
              width: double.infinity,
            ),
          ),
          DraggableScrollableSheet(
            builder: (context, controller) => SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.vertical,
              child: Container(
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 80,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DRIVER ASSIGNED",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "OTP: 2345",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ClipOval(
                            child: Image(
                              image: NetworkImage(
                                "https://www.axestrack.com/wp-content/uploads/2021/07/truck-driver-giving-thumbs-up-during-coronavirus-pandemic-1-1-scaled.jpg",
                              ),
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: const Column(
                              children: [
                                Text(
                                  "Abhishek Singh",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Maruti Suzuki Swift",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_phone,
                            size: 50,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.messenger_outline_rounded,
                            size: 50,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black, // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: Container(
                              color: Colors.yellow,
                              child: const Center(
                                child: Text(
                                  "KA 1 ZA 3345",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red.shade600,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ), // Adjust the radius as needed
                        ),
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Contact Support?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
