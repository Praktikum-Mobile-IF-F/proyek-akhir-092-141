import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/TrackerController.dart';
import 'package:project_prak_tpm/model/ValorantMatchModel.dart';

final timeNow = DateTime.now().toUtc();
final TrackerController trackerController = TrackerController();

class TrackerWidetContainer extends StatelessWidget {
  final MatchData matchData;
  const TrackerWidetContainer({super.key, required this.matchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Match Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _matchHistoryContainer(),
      ),
    );
  }

  Widget _matchHistoryContainer() {
    return ListView.builder(
      itemCount: matchData.matches.length,
      itemBuilder: (context, index) {
        return MatchCard(match: matchData.matches[index]);
      },
    );
  }
}

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 80,
              decoration: BoxDecoration(
                color: match.metadata!.result!.contains('defeat') ? Colors.red : Colors.green, // You can change the color as needed
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(width: 10.0),
            Image.network(
              match.segments[0].metadata!.agentImageUrl!,
              height: 60.0, // Menambahkan properti height
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        match.metadata!.mapName!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        trackerController.timeDifference(match.metadata!.timestamp!),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      3: IntrinsicColumnWidth(),
                    },
                    children: [
                      const TableRow(
                        children: [
                          Text('Result', textAlign: TextAlign.center),
                          Text('K/D/A', textAlign: TextAlign.center),
                          Text('K/D', textAlign: TextAlign.center),
                          Text('HS%', textAlign: TextAlign.center),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            '${match.segments[0].stats!.roundsWon!.value!} : ${match.segments[0].stats!.roundsLost!.value!}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${match.segments[0].stats!.kills!.value} / ${match.segments[0].stats!.deaths!.value} / ${match.segments[0].stats!.assists!.value}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${match.segments[0].stats!.kdRatio!.displayValue}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${match.segments[0].stats!.headshotsPercentage!.displayValue}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
