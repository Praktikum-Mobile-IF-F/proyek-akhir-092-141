import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Login/component/formField.dart';
import 'package:project_prak_tpm/screens/Login/component/loginButton.dart';
import 'package:project_prak_tpm/screens/Login/component/logoImage.dart';
import 'package:project_prak_tpm/screens/Login/component/registerText.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const logoImage(),
              _formContainer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  loginButton(),
                ],
              ),
              registerText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formContainer(){
    return Column(
      children: [
        formField(controller: userController, hint: "USERNAME", icon: const Icon(Icons.person)),
        formField(controller: passController, hint: "PASSWORD", icon: const Icon(Icons.lock), isPass: true,),
      ],
    );
  }
}
