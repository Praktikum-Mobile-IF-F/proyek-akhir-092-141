import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/controller/TrackerController.dart';
import 'package:project_prak_tpm/controller/UserController.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/model/ValorantTrackerModel.dart';
import 'package:project_prak_tpm/screens/Profile/component/PlayerEmptyScreen.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

import '../../utils/api/ApiRequest.dart';
import '../Home/component/LoadingScreen.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({super.key});

  @override
  _PlayerProfileScreenState createState() => _PlayerProfileScreenState();
}

late UserModel userData;

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  UserController userController = UserController();
  TrackerController trackerController = TrackerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        leading: const BackButton(
          color: ColorPallete.secondaryColor,
        ),
        title: Text(
          'Player Info',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _buildTracker(),
    );
  }

  Widget _buildTracker() {
    UserModel userData = UserController().getUserData(
        SharedPreferenceController.sharedPrefData.getString('email')!);
    String playerName = userData.playerName;
    String userTag = userData.tag;

    return FutureBuilder(
      future: ApiDataSource.instance.loadTrackerData(playerName, userTag),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          // Jika data ada error maka akan ditampilkan hasil error
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
          ValorantTrackerModel trackerData =
              ValorantTrackerModel.fromJson(snapshot.data);
          if(trackerData.data == null){
            return PlayerEmptyScreen(text: 'Data or User Not Found',);
          }
          ProfileTrackerData profileData = trackerData.data!;
          return _buildSuccessSection(profileData);
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

  Widget _buildSuccessSection(ProfileTrackerData profileData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {},
                    child: CircleAvatar(
                      backgroundImage: profileData
                              .platformInfo!.avatarUrl!.isNotEmpty
                          ? NetworkImage(profileData.platformInfo!.avatarUrl!)
                          : const AssetImage('assets/images/profile.jpg')
                              as ImageProvider,
                      radius: 50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileData.platformInfo!.platformUserIdentifier!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        profileData.segments![0].metadata!.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Level: ${profileData.metadata!.accountLevel!.toString()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildInfoRow(
                  profileData.segments[0].stats!.rank!.metadata!.iconUrl!,
                  "Rating",
                  profileData.segments[0].stats!.rank!.metadata!.tierName!),
              _buildInfoRow(
                  profileData.segments[0].stats!.peakRank!.metadata!.iconUrl!,
                  "Peak Rating",
                  '${profileData.segments[0].stats!.peakRank!.metadata!.tierName!} : ${profileData.segments[0].stats!.peakRank!.metadata!.actName!}'),
              _buildInfoRow(
                  trackerController.getPerfImage(profileData
                      .segments[0].stats!.trnPerformanceScore!.value!
                      .toInt()),
                  "Peformance Score",
                  '${profileData.segments[0].stats!.trnPerformanceScore!.value.toString()} / 1000',
                  assets: true),
              const SizedBox(height: 20),
              Text(
                "OVERVIEW:"!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Win %',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'K/D Ratio',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Headshot%',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Damage/Round',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        '${profileData.segments[0].stats!.matchesWinPct!.displayValue!}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        profileData.segments[0].stats!.kDRatio!.displayValue!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        profileData.segments[0].stats!.headshotsPercentage!.displayValue!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        profileData.segments[0].stats!.damagePerRound!.displayValue!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String iconUrl, String label, String value,
      {bool assets = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          assets
              ? Image.asset(
                  iconUrl,
                  height: 50.0,
                )
              : Image.network(
                  iconUrl,
                  height: 50.0,
                ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
