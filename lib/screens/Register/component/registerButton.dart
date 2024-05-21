import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/LoginController.dart';
import 'package:project_prak_tpm/controller/registerController.dart';

import '../../../utils/color/colorPalette.dart';

class registerButton extends StatelessWidget {
  const registerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: EdgeInsets.only(top: 30, right: 30),
      child: IconButton(
        onPressed: () => RegisterController.RegisterLogic(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.secondaryColor,
          foregroundColor: ColorPallete.thirdColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
    );
  }
}
