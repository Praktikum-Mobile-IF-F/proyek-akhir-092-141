import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/WeaponModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/screens/Home/component/WeaponsCard.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

import '../component/EmptyScreen.dart';

class WeaponTab extends StatefulWidget {
  final String searchText;
  const WeaponTab({super.key, required this.searchText});

  @override
  State<WeaponTab> createState() => _WeaponTabState();
}

class _WeaponTabState extends State<WeaponTab> {
  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadWeapon(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
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

    if(widget.searchText.isNotEmpty){
      searchedWeapon = weaponData.data!.where((element) => element.displayName!.toLowerCase().contains(widget.searchText.toLowerCase())).toList();
      if(searchedWeapon.isEmpty){
        return const EmptyScreen(text: 'Weapon Not Found');
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
      itemCount: widget.searchText.isNotEmpty? searchedWeapon!.length : weaponData.data!.length,
      itemBuilder: (context, index) {
        return WeaponCard(weaponData: widget.searchText.isNotEmpty ? searchedWeapon![index] : weaponData.data![index],);
      },
    );
  }
}