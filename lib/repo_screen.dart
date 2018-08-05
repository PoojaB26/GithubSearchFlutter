
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async_loader/async_loader.dart';
import 'package:github_search_async/api_services.dart';
import 'package:github_search_async/githu_repositories_model.dart';
import 'package:github_search_async/repo_list_item.dart';

class RepoScreen extends StatelessWidget {
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
  new GlobalKey<AsyncLoaderState>();


  Widget getNoConnectionWidget(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60.0,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/no-wifi.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        new Text("No Internet Connection"),
        new FlatButton(
            color: Colors.red,
            child: new Text("Retry", style: TextStyle(color: Colors.white),),
            onPressed: () => asyncLoaderState.currentState.reloadState())
      ],
    );
  }

  Widget getListView(ItemsList items){
    return new ListView.builder(
        itemCount: items.items.length,
        itemBuilder: (context, index) =>
        new RepoListItem(items.items[index])
    );
  }


  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: asyncLoaderState,
      initState: () async => await getRepositories(),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) => getNoConnectionWidget(),
      renderSuccess: ({data}) => getListView(data),
    );

    return new Scaffold(
      appBar: new AppBar(title: buildAppBarTitle('Github Repositories')),
      body: new Center(child: _asyncLoader),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => asyncLoaderState.currentState.reloadState(),
        tooltip: 'Reload',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

buildAppBarTitle(String title) {
  return new Padding(
    padding: new EdgeInsets.all(10.0),
    child: new Text(title),
  );
}