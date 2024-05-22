import 'package:flutter/material.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';
import '../component/AgentCard.dart';

class AgentTab extends StatefulWidget {
  final String searchText;
  const AgentTab({super.key, required this.searchText});

  @override
  State<AgentTab> createState() => _AgentTabState();
}

class _AgentTabState extends State<AgentTab> {
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
      child: CircularProgressIndicator(),
    );
  }
  
  Widget _successBuild(AgentModel agentData){
    List<AgentData>? searchedAgent;

    if(widget.searchText.isNotEmpty){
      searchedAgent = agentData.data!.where((element) => element.displayName!.contains(widget.searchText)).toList();
      if(searchedAgent.isEmpty){
        return const Text("NOT FOUND");
      }
    }
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
        itemCount: widget.searchText.isNotEmpty? searchedAgent!.length : agentData.data!.length,
        itemBuilder: (context, index) {
          return AgentCard(agentData: widget.searchText.isNotEmpty ? searchedAgent![index] : agentData.data![index]);
        },
      ),
    );
  }
}