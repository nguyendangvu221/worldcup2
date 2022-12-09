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
  const Countries(
      {required this.homeTeamEn,
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
            child: Container(
              child: homeFlag != null
                  ? Flags(flag: homeFlag)
                  : const CircularProgressIndicator(),
            ),
          ),
          homeFlag != null
              ? Expanded(
                  child: Text(
                    homeTeamEn,
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              : const CircularProgressIndicator(),
          (homeScorers != null && awayScorers != null)
              ? Expanded(
                  child: Center(
                    child: Text(
                      "$homeScorers-$awayScorers",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
          awayTeamEn != null
              ? Expanded(
                  child: Text(
                    awayTeamEn,
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 56, 162, 249)),
                  ),
                )
              : const CircularProgressIndicator(),
          awayFlag != null
              ? Expanded(
                  child: Flags(
                    flag: awayFlag,
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
