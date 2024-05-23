import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';

class bottomInfo extends StatefulWidget {
  final AgentData agentData;
  const bottomInfo({super.key, required this.agentData});

  @override
  State<bottomInfo> createState() => _bottomInfoState();
}

class _bottomInfoState extends State<bottomInfo> {
  int _selectedSkill = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const Text(
            'SPECIAL ABILITIES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Center(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.agentData.abilities!.length,
                  itemBuilder: (context, index) {
                    return _abilityIcon(widget.agentData.abilities![index].displayIcon ?? 'https://static.wikia.nocookie.net/valorant/images/a/ab/Overdrive.png/revision/latest?cb=20220107183512', index);
                  }),
            ),
          ),
          const SizedBox(height: 16.0),
          _abilityDesc(widget.agentData.abilities![_selectedSkill].displayName!, widget.agentData.abilities![_selectedSkill].description!),
        ],
      ),
    );
  }

  Widget _abilityIcon(String imageUrl, int skillIndex) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedSkill = skillIndex;
          });
        },
        child: Container(
            child: Image.network(imageUrl)),
      ),
    );
  }

  Widget _abilityDesc(String skillTitle, String desc) {
    return Column(
      children: [
        Text(skillTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(desc,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
