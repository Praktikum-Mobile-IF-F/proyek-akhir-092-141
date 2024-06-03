import 'package:flutter/material.dart';
import '../../Register//component/formField.dart';
import '../../Register/RegisterScreen.dart';

class formContainer extends StatefulWidget {
  const formContainer({super.key});

  @override
  State<formContainer> createState() => _formContainerState();
}

class _formContainerState extends State<formContainer> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            formField(
                controller: userControllerR,
                hint: "Username",
                icon: const Icon(Icons.person)),
            formField(
                controller: playerNameControllerR,
                hint: "In Game Username",
                icon: const Icon(Icons.games)),
            formField(
                controller: tagControllerR,
                hint: "Tag",
                icon: const Icon(Icons.tag)),
            formField(
              controller: emailControllerR,
              hint: "Email",
              icon: const Icon(Icons.mail),
              isEmail: true,
            ),
            formField(
              controller: passControllerR,
              hint: "Password",
              icon: const Icon(Icons.lock),
              isPass: true,
            ),
          ],
        ));
  }
}
