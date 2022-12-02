import 'package:flutter/material.dart';
import 'package:world_cup/src/models/matches.dart';
import 'package:world_cup/src/views/worldcup_view/match.dart';
import 'package:world_cup/src/views/worldcup_view/worldcup_screen.dart';

class MyApp extends StatelessWidget {
  final Future<List<Matches>> matches;
  const MyApp({required this.matches, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
        ),
        body: FutureBuilder<List<Matches>>(
            future: matches,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? WorldCupScreen(matches: snapshot.data!)
                  // return the ListView widget :
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
