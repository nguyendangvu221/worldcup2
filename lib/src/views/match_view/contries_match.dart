import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_cup/src/views/worldcup_view/flag.dart';

class CountriesMatch extends StatelessWidget {
  final int homeScorers;
  final int awayScorers;
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      //   toolbarHeight: 0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "asset/hinh-nen-bong-da.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
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
                                "$homeScorers - $awayScorers",
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
                    // Container(
                    //   margin: const EdgeInsets.only(top: 20, left: 50),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //           flex: 4,
                    //           child: Text(
                    //             homeTeamEn,
                    //             style: const TextStyle(
                    //                 fontSize: 20, color: Colors.white),
                    //           )),
                    //       Expanded(
                    //           flex: 2,
                    //           child: Text(
                    //             awayTeamEn,
                    //             style: const TextStyle(
                    //                 fontSize: 20, color: Colors.white),
                    //           ))
                    //   ],
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [Text("expanded 2")],
              ))
        ],
      ),
    );
  }
}
