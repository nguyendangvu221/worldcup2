import 'dart:convert';
import 'package:http/http.dart' as http;

class Matches {
  final String group;
  final int homeScorers;
  final int awayScorers;
  final DateTime localTime;
  final String timeElapsed;
  final bool finished;
  final String homeTeamEn;
  final String awayTeamEn;
  final String homeFlag;
  final String awayFlag;
  Matches(
      this.group,
      this.homeScorers,
      this.awayScorers,
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
        jsonMatches["group"] as String,
        // jsonMatches["homeTeamId"] as int,
        // jsonMatches["awayTeamId"] as int,
        jsonMatches["homeScorers"] as int,
        jsonMatches["awayScorers"] as int,
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
  List<Matches> parseMatches(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>(); 
   return parsed.map<Matches>((json) =>Matches.fromJsonMatches(json)).toList(); 
  }

  Future<List<Matches>> fetchMatches() async {
    const url = "http://api.cup2022.ir/api/v1/Matches";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
    return parseMatches(response.body);
    }
    else{
      throw Exception('Unable to fetch products from the REST API');
    }

  }
}
