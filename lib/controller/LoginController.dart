import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
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
    if (loginFormState.currentState!.validate() && dataBox.get('email') != null) {
      if (dataBox.get('email').contains(emailController.text)) {
        UserModel userData = dataBox.get(emailController.text);
        if (userData.password == passController.text) {
          loginData.setBool('login', true);
          loginData.setString('username', userData.username);
          loginData.setString('email', emailController.text);
          setSharedPreference();
          Navigator.pushReplacementNamed(context, '/home');
          return;
        }
      }
    }
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void setSharedPreference() async{
    await SharedPreferenceController.init();
  }
}
