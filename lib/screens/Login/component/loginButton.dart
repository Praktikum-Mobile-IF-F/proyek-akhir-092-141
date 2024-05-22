import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/LoginController.dart';
import 'package:project_prak_tpm/screens/Login/LoginScreen.dart';
import '../../../utils/color/colorPalette.dart';

class loginButton extends StatefulWidget {
  const loginButton({super.key});

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.only(top: 30, right: 30),
      child: IconButton(
        onPressed: () => LoginController.loginLogic(context, loginFormKey),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.secondaryColor,
          foregroundColor: ColorPallete.thirdColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}
