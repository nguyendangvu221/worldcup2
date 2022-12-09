import 'package:flutter/material.dart';
import 'package:world_cup/src/views/worldcup_view/countries.dart';

class Match extends StatelessWidget {
  final String group;
  final DateTime dateTime;
  final String homeTeamEn;
  final String awayTeamEn;
  final int homeScore;
  final int awayScore;
  final String homeFlag;
  final String awayFlag;
  const Match(
      {super.key,
      required this.group,
      required this.dateTime,
      required this.homeTeamEn,
      required this.awayTeamEn,
      required this.homeScore,
      required this.awayScore,
      required this.homeFlag,
      required this.awayFlag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  group,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                dateTime.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Countries(
              awayFlag: awayFlag,
              awayScorers: awayScore,
              awayTeamEn: awayTeamEn,
              homeFlag: homeFlag,
              homeScorers: homeScore,
              homeTeamEn: homeTeamEn,
            )),
        const Divider(color: Color.fromARGB(255, 216, 216, 216), thickness: 2),
      ],
    );
  }
}
