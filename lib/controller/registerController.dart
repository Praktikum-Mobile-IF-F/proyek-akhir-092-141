import 'package:flutter/material.dart';

class RegisterController {
  static void RegisterLogic(BuildContext context){
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Navigator.push((context), MaterialPageRoute(builder: (context) => Placeholder()));
  }
}