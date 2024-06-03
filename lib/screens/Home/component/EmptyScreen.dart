import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String text;
  const EmptyScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Image.asset('assets/images/valorant_logo_2.png'),
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
