import 'package:fleet_roving_employee/commons/colors.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/error_handling.dart';
import 'package:fleet_roving_employee/commons/contants/widgets/utils.dart';
import 'package:fleet_roving_employee/features/authentication/screens/login_screen.dart';
import 'package:fleet_roving_employee/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../commons/contants/widgets/show_snackbar.dart';
import '../../home/screens/home_screen.dart';

final authRepositoryProvider = Provider((ref) => AuthService());

class AuthService {
  void signupUser({
    required BuildContext context,
    required String userName,
    required String password,
  }) async {
    try {
      User user = User(
        id: "",
        userName: userName,
        password: password,
        address: "",
        company: "",
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(
            context,
            "Sucessfully logged in",
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );

          await SharedPref.saveUserLoggedInStatus(true);
          await SharedPref.saveUserName(userName);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logout(BuildContext context) async {
    await SharedPref.saveUserLoggedInStatus(false);
    await SharedPref.saveUserName('');
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
