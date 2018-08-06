import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:github_search_async/repositories_model.dart';


Future<ItemsList> getRepositories() async {
  final response = await http.get('https://api.github.com/search/repositories?q=flutter',
      headers: {
        HttpHeaders.CONTENT_TYPE : 'application/json',
      },
  );
  print(response.statusCode.toString() + "repo github");
  final responseJson = json.decode(response.body);
  return new ItemsList.fromJson(responseJson);
}