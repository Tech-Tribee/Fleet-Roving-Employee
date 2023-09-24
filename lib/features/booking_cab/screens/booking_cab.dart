import 'package:fleet_roving_employee/commons/contants/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

class BookCabScreen extends StatefulWidget {
  const BookCabScreen({Key? key}) : super(key: key);

  @override
  State<BookCabScreen> createState() => _BookCabScreenState();
}

class _BookCabScreenState extends State<BookCabScreen> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth / 2; // Half of the screen width

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Center(
            child: Text(
              "Cab live location will be shown here",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
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
                    Row(
                      children: [
                        // Calendar Container
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: containerWidth, // Set your desired color
                                child: Column(
                                  children: [
                                    const Text(
                                      "Start Trip",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      controller: dateController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onTap: () => _selectDate(context),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      controller: timeController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: Icon(Icons.access_time),
                                      ),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onTap: () => _selectTime(context),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ), // Add border here
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ), // Add border radius for rounded corners
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Book only start trip",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ReusableButtonConatiner(
                                      text: "Cancel",
                                      color: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 20.0,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: containerWidth, // Set your desired color
                                child: Column(
                                  children: [
                                    const Text(
                                      "End Trip",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      controller: dateEndController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onTap: () => _selectDateEnd(context),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      controller: timeEndController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: Icon(Icons.access_time),
                                      ),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onTap: () => _selectEndTime(context),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ), // Add border here
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ), // Add border radius for rounded corners
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Book only start trip",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ReusableButtonConatiner(
                                      text: "Book",
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      textColor: Colors.white,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
