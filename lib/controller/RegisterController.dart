import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/UserController.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/screens/Register/RegisterScreen.dart';
import 'package:project_prak_tpm/utils/notification/NotificationService.dart';

class RegisterController {
  static void registerLogic(
      BuildContext context, GlobalKey<FormState> registerFormState) {
    List<String>? emailData = dataBox.get('email');
    UserController userController = UserController();

    if (registerFormState.currentState!.validate()) {
      if (emailData == null) {
        dataBox.put('email', [emailControllerR.text]);

        UserModel userData = UserModel(
            username: userControllerR.text,
            email: emailControllerR.text,
            password: passControllerR.text,
            image: '',
            playerName: playerNameControllerR.text,
            tag: tagControllerR.text);
        userController.setUser(emailControllerR.text, userData);

        Navigator.pushReplacementNamed(context, '/login');
      } else if (!emailData.contains(emailControllerR.text)) {
        emailData.add(emailControllerR.text);
        dataBox.put('email', emailData);

        UserModel userData = UserModel(
            username: userControllerR.text,
            email: emailControllerR.text,
            password: passControllerR.text,
            image: '',
            playerName: playerNameControllerR.text,
            tag: tagControllerR.text);
        userController.setUser(emailControllerR.text, userData);

        // NotificationService().showNotification(title: 'Valorant App', body: 'Registration Success');
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        SnackBar snackBar =
            const SnackBar(content: Text("Register Failed, Change Your Email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      SnackBar snackBar = const SnackBar(content: Text("Register Failed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // print("DEBUG: [REGISTER CONTROLLER (HIVE]: ${dataBox.get('email')}");
  }
}
