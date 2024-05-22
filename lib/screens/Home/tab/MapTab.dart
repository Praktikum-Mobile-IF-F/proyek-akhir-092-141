import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/MapModel.dart';
import 'package:project_prak_tpm/screens/Home/component/MapCard.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

class MapTab extends StatefulWidget {
  final String searchText;
  const MapTab({super.key, required this.searchText});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
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
          WeaponModel mapData = WeaponModel.fromJson(snapshot.data);

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
      child: CircularProgressIndicator(),
    );
  }
  
  Widget _successBuild(WeaponModel mapData){
    List<WeaponData>? searchedMap;

    if(widget.searchText.isNotEmpty){
      searchedMap = mapData.data!.where((element) => element.displayName!.contains(widget.searchText)).toList();
      if(searchedMap.isEmpty){
        return const Text("NOT FOUND");
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