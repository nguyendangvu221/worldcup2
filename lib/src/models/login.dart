import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:world_cup/main.dart';
import 'package:world_cup/src/models/user.dart';

Future<String> login() async {
  final response = await http.post(
    Uri.parse('http://api.cup2022.ir/api/v1/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': User.kUser,
      'password': User.kPassword,
    }),
  );
  if (response.statusCode == 200) {
    return getToken(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
String getToken(Map<String, dynamic> json) {
  final token = json['data'] as Map<String, dynamic>;
  return token["token"] as String;
}
void doSomeThing() async{
  String str = await login();
  log(str);
  fetchMatches();
}