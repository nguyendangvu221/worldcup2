import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:world_cup/src/views/my_app.dart';
import 'package:world_cup/src/models/matches.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp(
    matches: fetchMatches(),
  ));
}

List<Matches> parseMatches(String jsonString) {
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Matches>((json) => Matches.fromJsonMatches(json)).toList();
}

Future<List<Matches>> fetchMatches() async {
  const url = "http://api.cup2022.ir/api/v1/Matches";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return parseMatches(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
