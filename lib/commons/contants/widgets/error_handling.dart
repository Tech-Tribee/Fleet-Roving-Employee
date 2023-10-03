import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'show_snackbar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      print("Logged in 200");
      onSuccess();
      break;
    case 400:
      print("Logged in 400");
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      print("Logged in 500");
      showSnackBar(context, jsonDecode(response.body)["error"]);
      break;
    default:
      showSnackBar(context, response.body);
      print("Logged in 1000");
  }
}
