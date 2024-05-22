import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/screens/Register/RegisterScreen.dart';

class RegisterController {
  static void registerLogic(BuildContext context, GlobalKey<FormState> registerFormState){
    List<String>? emailData = dataBox.get('email');

    if(registerFormState.currentState!.validate()){
      if(emailData == null){
        dataBox.put('email', [emailController.text]);
        dataBox.put(emailController.text, UserModel(username: userController.text, email: emailController.text, password: passController.text));
        UserModel user = dataBox.get(emailController.text);
        print(user.toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
      else if(!emailData.contains(emailController.text)){
        emailData.add(emailController.text);
        dataBox.put('email', emailData);
        dataBox.put(emailController.text, UserModel(username: userController.text, email: emailController.text, password: passController.text));
        UserModel user = dataBox.get(emailController.text);
        print(user.toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
      else{
        SnackBar snackBar = const SnackBar(content: Text("Register Failed, Change Your Email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    else{
      SnackBar snackBar = const SnackBar(content: Text("Register Failed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // print("DEBUG: [REGISTER CONTROLLER (HIVE]: ${dataBox.get('email')}");
  }
}