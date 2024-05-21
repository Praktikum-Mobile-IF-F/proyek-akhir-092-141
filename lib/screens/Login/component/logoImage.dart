import 'package:flutter/material.dart';

class logoImage extends StatelessWidget {
  const logoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      width: 120,
      child: Image.asset('assets/images/valorant_logo_2.png'),
    );
  }
}
