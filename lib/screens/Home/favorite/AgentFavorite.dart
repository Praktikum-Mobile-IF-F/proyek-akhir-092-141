import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';
import '../component/AgentCard.dart';

class AgentFavorite extends StatefulWidget {
  final String searchText;
  const AgentFavorite({super.key, required this.searchText});

  @override
  State<AgentFavorite> createState() => _AgentFavoriteState();
}

class _AgentFavoriteState extends State<AgentFavorite> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return _buildListAgent();
  }

  Widget _buildListAgent() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadCharacters(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
          AgentModel agentData = AgentModel.fromJson(snapshot.data);

          return _successBuild(agentData);
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
  
  Widget _successBuild(AgentModel agentData){
    List<AgentData>? searchedAgent;
    List<String> favoritedData = favoriteController.getFavoriteType('agent');

    searchedAgent = agentData.data!.where((element) => favoritedData.any((fav) => fav.contains(element.uuid!))).toList();
    if(widget.searchText.isNotEmpty){
      searchedAgent = searchedAgent.where((element) => element.displayName!.contains(widget.searchText)).toList();
      if(searchedAgent.isEmpty){
        return const Text("NOT FOUND");
      }
    }
    else{
      if(searchedAgent.isEmpty){
        return const Text("EMPTY");
      }
    }
    print(searchedAgent.length);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: searchedAgent!.length,
        itemBuilder: (context, index) {
          return AgentCard(agentData: searchedAgent![index]);
        },
      ),
    );
  }
}