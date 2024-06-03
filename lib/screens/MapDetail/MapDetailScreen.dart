import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/MapModel.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

class MapDetailScreen extends StatefulWidget {
  final MapData mapData;

  const MapDetailScreen({super.key, required this.mapData});
  @override
  State<MapDetailScreen> createState() => _MapDetailScreenState();
}

class _MapDetailScreenState extends State<MapDetailScreen> {
  FavoriteController favoriteController = FavoriteController();
  late String imageUrl;
  bool splashImage = true;

  @override
  void initState(){
    setState(() {
        imageUrl = widget.mapData.splash!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorPallete.secondaryColor,
        ),
        backgroundColor: const Color(0xFF1C1C1C),
        title: const Text('Map', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              if(splashImage){
                splashImage = false;
                imageUrl = 'https://imgsvc.trackercdn.com/url/max-width(1656),quality(66)/https%3A%2F%2Ftrackercdn.com%2Fcdn%2Ftracker.gg%2Fvalorant%2Fdb%2Fmaps%2F8.0%2F${widget.mapData.displayName!.toLowerCase()}.png/image.png';
              }
              else{
                imageUrl = widget.mapData.splash!;
                splashImage = true;
              }
            });
          }, icon: const Icon(Icons.map, color: ColorPallete.fourthColor,)),
          IconButton(onPressed: () {
            setState(() {
              favoriteController.setFavorite('map', widget.mapData.uuid!);
            });
          }, icon: Icon(Icons.favorite, color: favoriteController.checkFavorite('map', widget.mapData.uuid!) ? Colors.red : Colors.white,))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        imageUrl,
                        height: splashImage ? 300.0 : 400,
                      ),
                      Positioned(
                        top: 50.0,
                        left: 10,
                        child: Column(
                          children: [
                            Text( splashImage ?
                              widget.mapData.displayName! : '', // diganti nama map dari API
                              style: const TextStyle(
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
                  const SizedBox(height: 16.0),
                  const Text(
                    'Callout Map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.mapData.callouts!
                                .sublist(0, (widget.mapData.callouts!.length / 2).ceil())
                                .map((callout) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(
                                  '${callout.superRegionName!} - ${callout.regionName}',
                                  style: const TextStyle(
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
                            children: widget.mapData.callouts!
                                .sublist((widget.mapData.callouts!.length / 2).ceil())
                                .map((callout) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(
                                  '${callout.superRegionName} - ${callout.regionName}',
                                  style: const TextStyle(
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
      ),
    );
  }
}

class AbilityIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const AbilityIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
