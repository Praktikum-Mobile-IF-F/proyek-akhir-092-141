import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/BundleModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

import '../component/BundleCard.dart';
import '../component/EmptyScreen.dart';

class BundleTab extends StatefulWidget {
  final String searchText;
  const BundleTab({super.key, required this.searchText});

  @override
  State<BundleTab> createState() => _BundleTabState();
}

class _BundleTabState extends State<BundleTab> {
  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadBundleData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
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
  
  Widget _successBuild(BundleModel bundleData){
    List<BundleData>? searchedBundle;

    if(widget.searchText.isNotEmpty){
      searchedBundle = bundleData.data.where((element) => element.name!.toLowerCase().contains(widget.searchText.toLowerCase())).toList();
      if(searchedBundle.isEmpty){
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
      itemCount: widget.searchText.isNotEmpty? searchedBundle!.length : bundleData.data.length,
      itemBuilder: (context, index) {
        return BundleCard(bundleData: widget.searchText.isNotEmpty ? searchedBundle![index] : bundleData.data[index],);
      },
    );
  }
}