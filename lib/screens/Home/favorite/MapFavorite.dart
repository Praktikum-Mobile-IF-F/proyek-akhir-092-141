import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
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
  FavoriteController favoriteController = FavoriteController();

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

  Widget _successBuild(MapModel mapData) {
    List<MapData>? searchedMap;
    List<String> favoriteData = FavoriteController().getFavoriteType('map');

    searchedMap = mapData.data!
        .where(
            (element) => favoriteData.any((fav) => fav.contains(element.uuid!)))
        .toList();

    if (widget.searchText.isNotEmpty) {
      searchedMap = searchedMap
          .where((element) => element.displayName!.contains(widget.searchText))
          .toList();
      if (searchedMap.isEmpty) {
        return const EmptyScreen(text: 'Favorite Map Not Found');
      }
    }
    if (searchedMap.isEmpty) {
      return const EmptyScreen(text: 'Favorite Map Empty');
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: searchedMap.length,
      itemBuilder: (context, index) {
        return MapCard(mapData: searchedMap![index]);
      },
    );
  }
}
