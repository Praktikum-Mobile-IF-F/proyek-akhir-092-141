import 'package:flutter/material.dart';

class bottomInfo extends StatefulWidget {
  const bottomInfo({super.key});

  @override
  State<bottomInfo> createState() => _bottomInfoState();
}

class _bottomInfoState extends State<bottomInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'SPECIAL ABILITIES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _abilityIcon(Icons.label, Colors.white),
              _abilityIcon(Icons.label, Colors.white),
              _abilityIcon(Icons.label, Colors.white),
              _abilityIcon(Icons.label, Colors.white),
            ],
          ),
          SizedBox(height: 16.0),
          _abilityDesc('tes'),
        ],
      ),
    );
  }

  Widget _abilityIcon(IconData icon, Color color) {
    return Container(
      width: 75,
      height: 75,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {},
        child: Container(
            child: Image.network('https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png')),
      ),
    );
  }

  Widget _abilityDesc(String text) {
    return Container(
      child: Column(
        children: [
          Text(
            'Q - CURVEBALL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Equip a flare orb that takes a curving path and detonates shortly after throwing. '
              'FIRE to curve the flare orb to the left, detonating and blinding any player who sees the orb. '
              'ALTERNATE FIRE to curve the flare orb to the right.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
