import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_cup/src/models/login.dart';
import 'package:world_cup/src/views/my_app.dart';
import 'package:world_cup/src/models/matches.dart';
import 'package:http/http.dart' as http;

void main() {
  doSomeThing();
  runApp(MyApp(
    matches: fetchMatches(),
  ));
}

List<Matches> parseMatches(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final worldCupMatches = parsed['data'] as List<dynamic>;
  return worldCupMatches.map((e) => Matches.fromJsonMatches(e)).toList();
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
