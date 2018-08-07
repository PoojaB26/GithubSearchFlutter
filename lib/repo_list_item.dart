import 'package:flutter/material.dart';
import 'package:github_search_async/repositories_model.dart';

class RepoListItem extends StatelessWidget{
  final Item item;
  RepoListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(),
      child: Padding(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(item.name, style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0
                ),
              ),

              new Text(item.description??"", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0
              ),
              ),
            ],
          )),
    );
  }

}