import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/MapModel.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

class MapDetailScreen extends StatefulWidget {
  final MapData mapData;

  const MapDetailScreen({super.key, required this.mapData});
  @override
  State<MapDetailScreen> createState() => _MapDetailScreenState();
}

class _MapDetailScreenState extends State<MapDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
      appBar: AppBar(
        leading: const BackButton(
          color: ColorPallete.secondaryColor,
        ),
        backgroundColor: const Color(0xFF1C1C1C),
        title: const Text('Map', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.map, color: ColorPallete.fourthColor,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Memasukkan foto dari API
                    Image.network(
                      'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/splash.png',
                      height: 300.0,
                    ),
                    Positioned(
                      top: 50.0,
                      left: 10,
                      child: Column(
                        children: [
                          Text(
                            widget.mapData.displayName!, // diganti nama map dari API
                            style: TextStyle(
                              color: ColorPallete.thirdColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Callout Map',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: callouts
                              .sublist(0, (callouts.length / 2).ceil())
                              .map((callout) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                '${callout['superRegionName']} - ${callout['regionName']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: callouts
                              .sublist((callouts.length / 2).ceil())
                              .map((callout) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                '${callout['superRegionName']} - ${callout['regionName']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AbilityIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  AbilityIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[800],
      ),
      child: Icon(
        icon,
        color: color,
        size: 30.0,
      ),
    );
  }
}

List<Map<String, String>> callouts = [
  {
    "regionName": "Tree",
    "superRegionName": "A",
  },
  {
    "regionName": "Lobby",
    "superRegionName": "A",
  },
  {
    "regionName": "Main",
    "superRegionName": "A",
  },
  {
    "regionName": "Window",
    "superRegionName": "A",
  },
  {
    "regionName": "Site",
    "superRegionName": "A",
  },
  {
    "regionName": "Spawn",
    "superRegionName": "Attacker Side",
  },
  {
    "regionName": "Lobby",
    "superRegionName": "B",
  },
  {
    "regionName": "Main",
    "superRegionName": "B",
  },
  {
    "regionName": "Boat House",
    "superRegionName": "B",
  },
  {
    "regionName": "Bottom",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Site",
    "superRegionName": "B",
  },
  {
    "regionName": "Catwalk",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Cubby",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Spawn",
    "superRegionName": "Defender Side",
  },
  {
    "regionName": "Garden",
    "superRegionName": "A",
  },
  {
    "regionName": "Market",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Courtyard",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Link",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Pizza",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Rafters",
    "superRegionName": "A",
  },
  {
    "regionName": "Top",
    "superRegionName": "Mid",
  },
  {
    "regionName": "Wine",
    "superRegionName": "A",
  }
];
