import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/screens/Login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  late SharedPreferences loginData;

  LoginController() {
    getSharedPreferences();
  }

  void getSharedPreferences() async {
    loginData = await SharedPreferences.getInstance();
  }

  void loginLogic(BuildContext context, GlobalKey<FormState> loginFormState) {
    if (loginFormState.currentState!.validate()) {
      if (dataBox.get('email').contains(emailController.text)) {
        UserModel userData = dataBox.get(emailController.text);
        if (userData.password == passController.text) {
          loginData.setBool('login', true);
          loginData.setString('username', emailController.text);
          Navigator.pushReplacementNamed(context, '/home');
          return;
        }
      }
    }
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
