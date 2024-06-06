import 'package:flutter/material.dart';

class PlayerEmptyScreen extends StatelessWidget {
  final String text;
  const PlayerEmptyScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset('assets/images/valorant_logo_2.png'),
          ),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
