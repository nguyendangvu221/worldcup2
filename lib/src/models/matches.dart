import 'dart:convert';
import 'package:http/http.dart' as http;

class Matches {
  final String type;
  final String group;
  final DateTime localTime;
  final String timeElapsed;
  final bool finished;
  final String homeTeamEn;
  final String awayTeamEn;
  final String homeFlag;
  final String awayFlag;
  Matches(
      this.type,
      this.group,
      this.localTime,
      this.timeElapsed,
      this.finished,
      this.homeTeamEn,
      this.awayTeamEn,
      this.homeFlag,
      this.awayFlag);
  factory Matches.fromJsonMatches(Map<String, dynamic> jsonMatches) {
    return Matches(
        // jsonMatches["id"] as String,
        jsonMatches["type"] as String,
        jsonMatches["group"] as String,
        // jsonMatches["homeTeamId"] as int,
        // jsonMatches["awayTeamId"] as int,
        // jsonMatches["homeScores"] as int,
        // jsonMatches["awayScores"] as int,
        jsonMatches["localTime"] as DateTime,
        // jsonMatches["stadiumId"] as int,
        jsonMatches["timeElapsed"] as String,
        jsonMatches["finished"] as bool,
        // jsonMatches["matchDay"] as int,
        jsonMatches["homeTeamEn"] as String,
        jsonMatches["awayTeamEn"] as String,
        jsonMatches["homeFlag"] as String,
        jsonMatches["awayFlag"] as String);
  }
  List<Map<String, dynamic>> convertFromJsonToListOfMatches(String jsonString) {
    final jsonTeam = jsonDecode(jsonString);
    return jsonTeam;
  }

  Future<List<Matches>> getTeamFromBackend() async {
    List<Matches> listMatches = [];
    const url = "http://api.cup2022.ir/api/v1/Matches";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonString = response.body;
    final jsonMatches = convertFromJsonToListOfMatches(jsonString);
    for (var i = 0; i < jsonMatches.length; i++) {
      final matches = Matches.fromJsonMatches(jsonMatches[i]);
      listMatches.add(matches);
    }
    return listMatches;
  }
}
