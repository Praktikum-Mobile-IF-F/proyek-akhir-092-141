import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/controller/UserController.dart';
import 'package:project_prak_tpm/model/AgentModel.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/model/ValorantMatchModel.dart';
import 'package:project_prak_tpm/model/ValorantTrackerModel.dart';
import 'package:project_prak_tpm/screens/Home/component/LoadingScreen.dart';
import 'package:project_prak_tpm/screens/Tracker/component/TrackerWidgetContainer.dart';
import 'package:project_prak_tpm/utils/api/ApiRequest.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildListAgent();
  }

  Widget _buildListAgent() {
    UserModel userData = UserController().getUserData(SharedPreferenceController.sharedPrefData.getString('email')!);
    String playerName = userData.playerName;
    String userTag = userData.tag;
    return FutureBuilder(
      future: ApiDataSource.instance.loadMatchTrackerData(playerName, userTag),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
          ValorantMatchModel trackerData = ValorantMatchModel.fromJson(snapshot.data);
          return _successBuild(trackerData);
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

  Widget _successBuild(ValorantMatchModel trackerData){

    return SafeArea(
      child: TrackerWidetContainer(matchData: trackerData.data!,),
    );
  }
}