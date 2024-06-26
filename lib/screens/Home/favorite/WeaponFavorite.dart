import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/WeaponModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/screens/Home/component/WeaponsCard.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

import '../component/EmptyScreen.dart';

class WeaponFavorite extends StatefulWidget {
  final String searchText;
  const WeaponFavorite({super.key, required this.searchText});

  @override
  State<WeaponFavorite> createState() => _WeaponFavoriteState();
}

class _WeaponFavoriteState extends State<WeaponFavorite> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadWeapon(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          WeaponModel weaponData = WeaponModel.fromJson(snapshot.data);

          return _successBuild(weaponData);
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
  
  Widget _successBuild(WeaponModel weaponData){
    List<WeaponData>? searchedWeapon;
    List<String> favoriteData = FavoriteController().getFavoriteType('weapon');

    searchedWeapon = weaponData.data!
        .where(
            (element) => favoriteData.any((fav) => fav.contains(element.uuid!)))
        .toList();

    if (widget.searchText.isNotEmpty) {
      searchedWeapon = searchedWeapon.where((element) => element.displayName!.toLowerCase().contains(widget.searchText.toLowerCase())).toList();
      if (searchedWeapon.isEmpty) {
        return const EmptyScreen(text: 'Favorite Weapon Not Found');
      }
    }
    if (searchedWeapon.isEmpty) {
      return const EmptyScreen(text: 'Favorite Weapon Empty');
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: searchedWeapon.length,
      itemBuilder: (context, index) {
        return WeaponCard(weaponData: searchedWeapon![index]);
      },
    );
  }
}