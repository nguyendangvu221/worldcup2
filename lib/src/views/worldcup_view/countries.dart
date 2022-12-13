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
            // child: Container(
            child: homeFlag != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flags(flag: homeFlag),
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
            // ),
          ),
          // homeFlag != null
          //     ? Expanded(
          //         child: Text(
          //           homeTeamEn,
          //           style: const TextStyle(fontSize: 17, color: Colors.red),
          //         ),
          //       )
          //     : const CircularProgressIndicator(),
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
                  : const Expanded(
                      flex: 1,
                      child: Center(
                        child: Image(
                            image: AssetImage(
                              "asset/bell.png",
                            ),
                            width: 30),
                        // style: TextStyle(
                        //   fontSize: 17,
                        //   fontWeight: FontWeight.bold,
                        // ),
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
                        flag: awayFlag,
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
          // awayFlag != null
          //     ? Expanded(
          //         child: Flags(
          //           flag: awayFlag,
          //         ),
          //       )
          //     : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
