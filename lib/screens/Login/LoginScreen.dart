import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Login/component/formContainer.dart';
import 'package:project_prak_tpm/screens/Login/component/loginButton.dart';
import 'package:project_prak_tpm/screens/Login/component/logoImage.dart';
import 'package:project_prak_tpm/screens/Login/component/registerText.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
final loginFormKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoImage(),
              formContainer(),
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
}
