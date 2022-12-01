import 'dart:convert';
import 'package:http/http.dart' as http;
class Team{
  final String nameEn;
  final String flag;
  final String fiFaCode;
  final String iso2;
  final String groups;
  final int id;
  Team(this.nameEn,this.flag,this.fiFaCode,this.iso2,this.groups,this.id);
  factory Team.fromJsonTeam(Map<String, dynamic> jsonTeam){
    return Team(
      jsonTeam["nameEn"] as String,
      jsonTeam["flag"] as String,
      jsonTeam["fiFaCode"] as String,
      jsonTeam["iso2"] as String,
      jsonTeam["groups"] as String,
      jsonTeam["id"] as int,
    );
  }
}
List<Map<String,dynamic>> convertFromJsonToListOfTeam(String jsonString){
  final jsonTeam  = jsonDecode(jsonString);
  return jsonTeam;
}
Future<List<Team>> getTeamFromBackend() async{
  List<Team> listTeam = [];
  const url = "http://api.cup2022.ir/api/v1/team";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonString = response.body;
    final jsonTeam = convertFromJsonToListOfTeam(jsonString);
    for (var i = 0; i < jsonTeam.length; i++) {
    final team = Team.fromJsonTeam(jsonTeam[i]);
    listTeam.add(team);
  }
  return listTeam;
}