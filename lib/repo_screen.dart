
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async_loader/async_loader.dart';
import 'package:github_search_async/api_services.dart';
import 'package:github_search_async/repositories_model.dart';
import 'package:github_search_async/repo_list_item.dart';

class RepoScreen extends StatelessWidget {
  // todo set globalKey


 //todo noConnectionMethod

  Widget getListView(ItemsList items){
    return new ListView.builder(
        itemCount: items.items.length,
        itemBuilder: (context, index) =>
        new RepoListItem(items.items[index])
    );
  }

  //todo handleRefresh method

  @override
  Widget build(BuildContext context) {
    //todo setup AsyncLoader

    return new Scaffold(
      appBar: new AppBar(title: buildAppBarTitle('Github Repositories')),
      body: //todo call asyncLoader
      new Container(),
    );
  }
}

buildAppBarTitle(String title) {
  return new Padding(
    padding: new EdgeInsets.all(10.0),
    child: new Text(title),
  );
}