import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_cup/src/models/matches.dart';
import 'package:world_cup/src/views/worldcup_view/match.dart';

class WorldCupScreen extends StatelessWidget {
  List<Matches> matches;
  WorldCupScreen({required this.matches, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) => Match(
            group: matches[index].group,
            dateTime: matches[index].localTime,
            homeTeamEn: matches[index].homeTeamEn,
            awayTeamEn: matches[index].awayTeamEn,
            homeScorers: matches[index].homeScorers,
            awayScorers: matches[index].awayScorers,
            homeFlag: matches[index].homeFlag,
            awayFlag: matches[index].awayFlag),
        itemCount: matches.length,
      ),
    );
  }
}
