import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_cup/src/views/worldcup_view/flag.dart';

class CountriesMatch extends StatelessWidget {
  final String homeScorers;
  final String awayScorers;
  final int homeScore;
  final int awayScore;
  final String homeFlag;
  final String awayFlag;
  final String homeTeamEn;
  final String awayTeamEn;
  final String group;
  final DateFormat dateFormat;
  final DateTime dateTime;
  const CountriesMatch(
      {required this.homeFlag,
      required this.homeScorers,
      required this.homeScore,
      required this.awayScore,
      required this.awayScorers,
      required this.homeTeamEn,
      required this.awayFlag,
      required this.awayTeamEn,
      required this.group,
      required this.dateFormat,
      required this.dateTime,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "asset/hinh-nen-bong-da.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 35, right: 380),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ))),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "$group, " "${dateFormat.format(dateTime)}",
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Flags(
                                    flag: homeFlag,
                                    height: 70,
                                    width: 70,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      homeTeamEn,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  )
                                ],
                              )),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                "$homeScore - $awayScore",
                                style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Flags(
                                    flag: awayFlag,
                                    height: 70,
                                    width: 70,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      awayTeamEn,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Card(
              color: Colors.white.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      homeScorers != 'null'
                          ? homeScorers.toString().replaceAll(',', '\n')
                          : '',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.end,
                    )),
                    Expanded(
                        child: Image.asset(
                      "asset/football.png",
                      scale: 5.5,
                    )),
                    Expanded(
                        child: Text(
                      awayScorers != 'null'
                          ? awayScorers.toString().replaceAll(',', '\n')
                          : '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                  ],
                )
              ]),
            ))
          ],
        ),
      ),
    );
  }
}
