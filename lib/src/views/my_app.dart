import 'package:flutter/material.dart';
import 'package:world_cup/src/models/matches.dart';
import 'package:world_cup/src/views/worldcup_view/appbar_match.dart';
import 'package:world_cup/src/views/worldcup_view/drawer_match.dart';
import 'package:world_cup/src/views/worldcup_view/match.dart';
import 'package:world_cup/src/views/worldcup_view/worldcup_screen.dart';

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  final Future<List<Matches>> matches;
  const MyApp({required this.matches, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const DrawerMatch(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBarMatch(),
        ),
        // body: WorldCupScreen(),
        body: FutureBuilder<List<Matches>>(
            future: matches,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? WorldCupScreen(matches: snapshot.data!)
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
