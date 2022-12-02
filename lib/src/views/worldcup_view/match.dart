import 'package:flutter/material.dart';
import 'package:world_cup/src/views/worldcup_view/countries.dart';

class Match extends StatelessWidget {
  final String group;
  final DateTime dateTime;
  final String homeTeamEn;
  final String awayTeamEn;
  final int homeScorers;
  final int awayScorers;
  final String homeFlag;
  final String awayFlag;
  const Match(
      {super.key,
      required this.group,
      required this.dateTime,
      required this.homeTeamEn,
      required this.awayTeamEn,
      required this.homeScorers,
      required this.awayScorers,
      required this.homeFlag,
      required this.awayFlag});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child:  Text(
                group,
                style:const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 105),
              child:  Text(
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
              awayScorers: awayScorers,
              awayTeamEn: awayTeamEn,
              homeFlag: homeFlag,
              homeScorers: homeScorers,
              homeTeamEn: homeTeamEn,
            )),
        const Divider(color: Color.fromARGB(255, 216, 216, 216), thickness: 2),
      ],
    );
  }
}
