import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/BundleModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

import '../component/BundleCard.dart';
import '../component/EmptyScreen.dart';

class BundleFavorite extends StatefulWidget {
  final String searchText;
  const BundleFavorite({super.key, required this.searchText});

  @override
  State<BundleFavorite> createState() => _BundleFavoriteState();
}

class _BundleFavoriteState extends State<BundleFavorite> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadBundleData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          BundleModel bundleData = BundleModel.fromJson(snapshot.data);

          return _successBuild(bundleData);
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
  
  Widget _successBuild(BundleModel bundleData) {
    List<BundleData>? searchedBundle;
    List<String> favoriteData = FavoriteController().getFavoriteType('bundle');

    searchedBundle = bundleData.data!
        .where(
            (element) => favoriteData.any((fav) => fav.contains(element.id.toString()!)))
        .toList();

    if (widget.searchText.isNotEmpty) {
      searchedBundle = searchedBundle.where((element) => element.name!.toLowerCase().contains(widget.searchText.toLowerCase())).toList();
      if (searchedBundle.isEmpty) {
        return const EmptyScreen(text: 'Favorite Bundle Not Found');
      }
    }
    if (searchedBundle.isEmpty) {
      return const EmptyScreen(text: 'Favorite Bundle Empty');
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: searchedBundle.length,
      itemBuilder: (context, index) {
        return BundleCard(bundleData: searchedBundle![index]);
      },
    );
  }
}