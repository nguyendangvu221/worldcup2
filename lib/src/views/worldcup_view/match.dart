import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_cup/src/views/worldcup_view/countries.dart';
import 'package:world_cup/src/views/worldcup_view/group_and_date_wcview.dart';

class Match extends StatelessWidget {
  final String finished;
  final String group;
  final DateFormat dateFormat;
  final DateTime dateTime;
  final String homeTeamEn;
  final String awayTeamEn;
  final int homeScore;
  final int awayScore;
  final String homeFlag;
  final String awayFlag;
  final Function() onPressed;
  const Match(
      {super.key,
      required this.finished,
      required this.onPressed,
      required this.dateFormat,
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
    return TextButton(
      style: TextButton.styleFrom(
          minimumSize: const Size(400, 50), maximumSize: const Size(400, 106)),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: GroupAndDate(
                  dateTime: dateTime, group: group, dateFormat: dateFormat)),
          Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: Countries(
              finished: finished,
              awayFlag: awayFlag,
              awayScorers: awayScore,
              awayTeamEn: awayTeamEn,
              homeFlag: homeFlag,
              homeScorers: homeScore,
              homeTeamEn: homeTeamEn,
            ),
          ),
        ],
      ),
    );
  }
}
