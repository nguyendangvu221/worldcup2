// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:world_cup/src/views/worldcup_view/flag.dart';

class Countries extends StatelessWidget {
  final String homeTeamEn;
  final String awayTeamEn;
  final int homeScorers;
  final int awayScorers;
  final String homeFlag;
  final String awayFlag;
  final String finished;
  const Countries(
      {required this.homeTeamEn,
      required this.finished,
      required this.awayTeamEn,
      required this.homeScorers,
      required this.awayScorers,
      required this.homeFlag,
      required this.awayFlag,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: homeFlag != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flags(
                        flag: homeFlag,
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          homeTeamEn,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.red),
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          ),
          (homeScorers != null && awayScorers != null)
              ? finished == "TRUE"
                  ? Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "$homeScorers-$awayScorers",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset(
                          "asset/bell.png",
                          width: 30,
                        ),
                      ),
                    )
              : const CircularProgressIndicator(),
          awayTeamEn != null
              ? Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Text(
                          awayTeamEn,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 56, 162, 249)),
                        ),
                      ),
                      Flags(
                        height: 50,
                        width: 50,
                        flag: awayFlag,
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
