import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_recipes/model/recipe.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  RecipeDetails({this.recipe});

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset("assets/images/${widget.recipe.id}.jpg"),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              widget.recipe.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "UniSans"),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              widget.recipe.description,
              style: TextStyle(fontSize: 17, fontFamily: "Raleway", fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
