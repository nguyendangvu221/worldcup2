import 'package:world_cup/src/models/matches.dart';
import 'package:world_cup/src/views/match_view/contries_match.dart';
import 'package:world_cup/src/views/worldcup_view/match.dart';
import 'package:flutter/material.dart';

class WorldCupScreen extends StatelessWidget {
  final List<Matches> matches;
  const WorldCupScreen({required this.matches, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Color.fromARGB(255, 216, 216, 216),
        thickness: 2,
        height: 1,
      ),
      itemBuilder: (context, index) => Match(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountriesMatch(
                      homeScore: matches[index].homeScore,
                      awayScore: matches[index].awayScore,
                      homeScorers: matches[index].homeScorers,
                      awayScorers: matches[index].awayScorers,
                      homeFlag: matches[index].homeFlag,
                      homeTeamEn: matches[index].homeTeamEn,
                      awayFlag: matches[index].awayFlag,
                      awayTeamEn: matches[index].awayTeamEn,
                      group: matches[index].group,
                      dateFormat: matches[index].formatDate,
                      dateTime: matches[index].localDate),
                ));
          },
          finished: matches[index].finished,
          group: "Group ${matches[index].group}",
          dateFormat: matches[index].formatDate,
          dateTime: matches[index].localDate,
          homeTeamEn: matches[index].homeTeamEn,
          awayTeamEn: matches[index].awayTeamEn,
          homeScore: matches[index].homeScore,
          awayScore: matches[index].awayScore,
          homeFlag: matches[index].homeFlag,
          awayFlag: matches[index].awayFlag),
      itemCount: matches.length,
    );
  }
}
