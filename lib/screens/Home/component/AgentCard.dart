import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';
import 'package:project_prak_tpm/screens/AgentDetail/AgentDetailScreen.dart';

class AgentCard extends StatefulWidget {
  final AgentData agentData;

  const AgentCard({super.key, required this.agentData});

  @override
  _AgentCardState createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AgentDetailScreen(agentData: widget.agentData)));
      },
      child: Card(
        color: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 140, // Memperbesar area gambar
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(widget.agentData.displayIcon!)
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.agentData.displayName!,
                    style: const TextStyle(
                      fontSize: 18, // Mengurangi ukuran font
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}