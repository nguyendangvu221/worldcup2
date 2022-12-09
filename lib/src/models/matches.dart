import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:world_cup/src/models/login.dart';

class Matches {
  final String id;
  final String group;
  final String homeTeamId;
  final String awayTeamId;
  final int homeScore;
  final int awayScore;
  final String homeScorers;
  final String awayScorers;
  final DateTime localDate;
  final String timeElapsed;
  final String finished;
  final String matchday;
  final String homeTeamEn;
  final String awayTeamEn;
  final String homeFlag;
  final String awayFlag;
  Matches({
    required this.id,
    required this.group,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.homeScore,
    required this.awayScore,
    required this.homeScorers,
    required this.awayScorers,
    required this.localDate,
    required this.timeElapsed,
    required this.finished,
    required this.matchday,
    required this.homeTeamEn,
    required this.awayTeamEn,
    required this.homeFlag,
    required this.awayFlag,
  });
  factory Matches.fromJsonMatches(Map<String, dynamic> jsonMatches) {
    return Matches(
      id: jsonMatches['id'] as String,
      group: jsonMatches['group'] as String,
      homeTeamId: jsonMatches['home_team_id'] as String,
      awayTeamId: jsonMatches['away_team_id'] as String,
      homeScore: jsonMatches['home_score'] as int,
      awayScore: jsonMatches['away_score'] as int,
      homeScorers:
          jsonMatches['home_scorers'].toString().split('[')[1].split(']')[0],
      awayScorers:
          jsonMatches['away_scorers'].toString().split('[')[1].split(']')[0],
      localDate: DateTime(
          int.parse(
              jsonMatches['local_date'].toString().split('/')[2].split(' ')[0]),
          int.parse(jsonMatches['local_date'].toString().split('/')[0]),
          int.parse(jsonMatches['local_date'].toString().split('/')[1]),
          int.parse(
              jsonMatches['local_date'].toString().split(' ')[1].split(':')[0]),
          int.parse(jsonMatches['local_date']
              .toString()
              .split(' ')[1]
              .split(':')[1])),

      timeElapsed: jsonMatches['time_elapsed'] as String,
      finished: jsonMatches['finished'] as String,
      matchday: jsonMatches['matchday'] as String,
      homeTeamEn: jsonMatches['home_team_en'] as String,
      awayTeamEn: jsonMatches['away_team_en'] as String,
      homeFlag: jsonMatches['home_flag'] as String,
      awayFlag: jsonMatches['away_flag'] as String,
    );
  }
  List<Matches> parseMatches(String jsonString) {
    List<Matches> parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsed;
  }

  Future<List<Matches>> fetchMatches() async {
    const url = "http://api.cup2022.ir/api/v1/match";
    final uri = Uri.parse(url);
    final token = await login();
    final response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      log(response.body);
      return parseMatches(response.body);
    } else {
      throw Exception('Error server');
    }
  }
}
