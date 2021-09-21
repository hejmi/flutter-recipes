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
        _characterList = list.map((model) => Character.fromJson(model)).toList();
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
          title: Text("Breaking Bad Characters"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _characterList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_characterList[index].title),
                  subtitle: Text(_characterList[index].description),
                );
              }),
        ));
  }
}
