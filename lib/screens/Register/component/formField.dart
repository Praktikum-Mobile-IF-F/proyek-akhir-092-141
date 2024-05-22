import 'package:flutter/material.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

class formField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final bool isEmail;
  final String hint;
  final Icon icon;

  const formField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      this.isPass = false,
      this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          labelText: hint,
          hintText: hint,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ColorPallete.thirdColor,
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Fill This Field";
          }
          if (!value.contains('@') && isEmail) {
            return "Please use correct email address using @";
          }
          if (value.length < 8 && isPass) {
            return 'Minimum Password Lenght is 8';
          }
          return null;
        },
      ),
    );
  }
}
