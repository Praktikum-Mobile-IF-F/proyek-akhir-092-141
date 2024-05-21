import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/LoginController.dart';

import '../../../utils/color/colorPalette.dart';

class loginButton extends StatelessWidget {
  const loginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: EdgeInsets.only(top: 30, right: 30),
      child: IconButton(
        onPressed: () => LoginController.loginLogic(context),
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
