import 'dart:convert';

import 'package:flutter_recipes/data/recipes_api.dart';
import 'package:flutter_recipes/model/recipe.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  CharacterList({Key key}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  List<Character> _characterList = [];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _characterList =
            list.map((model) => Character.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Flutter Recipes"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _characterList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Color(0x00999999),
                  hoverColor: Color(0x99990000),
                  minVerticalPadding: 10,
                  title: Text(_characterList[index].title),
                  subtitle: Text(_characterList[index].description),
                  trailing: Container(
                    width: 45,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.timer_sharp, size: 17, ),
                        Expanded(child: Text(_characterList[index].cookingtime.toString() + " min.",style: TextStyle(fontSize: 12))) ,
                    ])),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/" +
                        _characterList[index].id.toString() +
                        ".jpg"),
                    radius: 30,
                  ),
                );
              }),
        ));
  }
}
