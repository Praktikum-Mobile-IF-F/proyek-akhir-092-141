import 'package:flutter/material.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/screens/Register/RegisterScreen.dart';

class RegisterController {
  static void RegisterLogic(BuildContext context){
    List<String>? emailData = dataBox.get('email');

    if(emailData == null){
      dataBox.put('email', [emailController.text]);
    }
    else if(!emailData.contains(emailController.text)){
      emailData.add(emailController.text);
      dataBox.put('email', emailData);
    }
    print(dataBox.get('email'));
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Navigator.push((context), MaterialPageRoute(builder: (context) => Placeholder()));
  }
}