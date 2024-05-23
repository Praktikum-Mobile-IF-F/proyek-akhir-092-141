import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';

class topInfo extends StatelessWidget {
  final AgentData agentData;
  const topInfo({super.key, required this.agentData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          agentData.fullPortrait!,
          height: 375.0,
        ),
        Positioned(
          top: 40.0,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                agentData.displayName!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                agentData.role!.displayName!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            height: 50,
            child: Image.network(agentData.role!.displayIcon!),
          ),
        ),
      ],
    );
  }
}
