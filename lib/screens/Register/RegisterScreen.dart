import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Register/component/formField.dart';
import 'package:project_prak_tpm/screens/Register/component/loginText.dart';
import 'package:project_prak_tpm/screens/Register/component/logoImage.dart';
import 'package:project_prak_tpm/screens/Register/component/registerButton.dart';
import 'package:project_prak_tpm/screens/Register/component/topBanner.dart';

TextEditingController userController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const topBanner(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const logoImage(),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
                      child: const Text(
                        "REGISTER",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  _formContainer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: 30), // Align button properly
                        child: registerButton(),
                      ),
                    ],
                  ),
                  const loginText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formContainer() {
    return Column(
      children: [
        formField(
            controller: userController,
            hint: "USERNAME",
            icon: const Icon(Icons.person)),
        formField(
            controller: emailController,
            hint: "Email",
            icon: const Icon(Icons.mail)),
        formField(
          controller: passController,
          hint: "PASSWORD",
          icon: const Icon(Icons.lock),
          isPass: true,
        ),
      ],
    );
  }
}
