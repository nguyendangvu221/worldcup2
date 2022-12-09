import 'package:world_cup/src/models/matches.dart';
import 'package:world_cup/src/views/worldcup_view/match.dart';
import 'package:flutter/material.dart';

class WorldCupScreen extends StatelessWidget {
  final List<Matches> matches;
  const WorldCupScreen({required this.matches, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) => Match(
            group: "Group ${matches[index].group}",
            dateTime: matches[index].localDate,
            homeTeamEn: matches[index].homeTeamEn,
            awayTeamEn: matches[index].awayTeamEn,
            homeScore: matches[index].homeScore,
            awayScore: matches[index].awayScore,
            homeFlag: matches[index].homeFlag,
            awayFlag: matches[index].awayFlag),
        itemCount: matches.length,
      ),
    );
  }
}
