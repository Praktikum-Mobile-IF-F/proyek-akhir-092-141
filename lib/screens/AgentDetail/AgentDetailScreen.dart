import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/AgentDetail/component/bottomInfo.dart';
import 'package:project_prak_tpm/screens/AgentDetail/component/topInfo.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

class AgentDetailScreen extends StatelessWidget {
  const AgentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        title: const Text('Agent', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            topInfo(),
            bottomInfo(),
          ],
        ),
      ),
    );
  }
}