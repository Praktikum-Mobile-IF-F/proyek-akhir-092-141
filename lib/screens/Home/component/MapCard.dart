import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/MapModel.dart';

class MapCard extends StatefulWidget {
  final WeaponData mapData;

  const MapCard({super.key, required this.mapData});

  @override
  _MapCardState createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                      image: NetworkImage(widget.mapData.splash!),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.mapData.displayName!,
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