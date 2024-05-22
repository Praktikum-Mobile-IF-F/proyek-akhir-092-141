import 'package:flutter/material.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/screens/Login/LoginScreen.dart';

class LoginController {
  static void loginLogic(BuildContext context, GlobalKey<FormState> loginFormState){
    if(loginFormState.currentState!.validate()){
      if(dataBox.get('email').contains(emailController.text)){
        UserModel userData = dataBox.get(emailController.text);
        if(userData.password == passController.text){
          SnackBar snackBar = const SnackBar(content: Text("Login Success"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
      }
    }
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Navigator.push((context), MaterialPageRoute(builder: (context) => Placeholder()));
  }
}