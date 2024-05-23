import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Register/component/formContainer.dart';
import 'package:project_prak_tpm/screens/Register/component/loginText.dart';
import 'package:project_prak_tpm/screens/Register/component/logoImage.dart';
import 'package:project_prak_tpm/screens/Register/component/registerButton.dart';
import 'package:project_prak_tpm/screens/Register/component/topBanner.dart';

TextEditingController userControllerR = TextEditingController();
TextEditingController emailControllerR = TextEditingController();
TextEditingController passControllerR = TextEditingController();
final registerFormKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const topBanner(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const logoImage(),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                const formContainer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 30), // Align button properly
                      child: registerButton(),
                    ),
                  ],
                ),
                const loginText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
