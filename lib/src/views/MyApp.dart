import 'package:flutter/material.dart';
import 'package:world_cup/src/views/worldcup_view/flag.dart';
import 'package:world_cup/src/views/worldcup_view/worldcup_view.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    //  home:  WorldCupPage(),
    home: Scaffold(
      body: Flags(),
    ),
    );
  }
}
