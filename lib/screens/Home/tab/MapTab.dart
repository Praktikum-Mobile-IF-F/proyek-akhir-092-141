import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/MapModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/screens/Home/component/MapCard.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

import '../component/EmptyScreen.dart';

class MapFavorite extends StatefulWidget {
  final String searchText;
  const MapFavorite({super.key, required this.searchText});

  @override
  State<MapFavorite> createState() => _MapFavoriteState();
}

class _MapFavoriteState extends State<MapFavorite> {
  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadMap(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
          MapModel mapData = MapModel.fromJson(snapshot.data);

          return _successBuild(mapData);
        }
        return _buildLoadingSection();
      },
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: LoadingScreen(),
    );
  }
  
  Widget _successBuild(MapModel mapData){
    List<MapData>? searchedMap;

    if(widget.searchText.isNotEmpty){
      searchedMap = mapData.data!.where((element) => element.displayName!.toLowerCase().contains(widget.searchText.toLowerCase())).toList();
      if(searchedMap.isEmpty){
        return const EmptyScreen(text: 'Map Not Found');
      }
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: widget.searchText.isNotEmpty? searchedMap!.length : mapData.data!.length,
      itemBuilder: (context, index) {
        return MapCard(mapData: widget.searchText.isNotEmpty ? searchedMap![index] : mapData.data![index]);
      },
    );
  }
}