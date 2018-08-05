import 'package:flutter/material.dart';
import 'package:github_search_async/repo_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Github Search',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RepoScreen(),
    );
  }
}