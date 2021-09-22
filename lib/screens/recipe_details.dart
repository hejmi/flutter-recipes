import 'dart:ui';
import 'package:neumorphic_container/neumorphic_container.dart';
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
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            title: Text(widget.recipe.title),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Text('Recipe Details'),
                ),
                Tab(
                  icon: Text('Ingredients'),
                ),
                Tab(
                  icon: Text('Steps'),
                ),
              ],
            ),
          ),
        body: TabBarView (
          children: <Widget> [
            Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: NeumorphicContainer(
                      height: 40,
                      width: 40,
                      borderRadius: 40,
                      spread: 2,
                      primaryColor: Color(0xfff0f0f0),
                      //flat neumorphism design
                      curvature: Curvature.concave,
                      child: Icon(Icons.favorite_outline, color: Colors.red, size: 23)
                  ),
                  ),
                  ],
                  ),
                ),
            Container(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ingredients you need",
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
            Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: NeumorphicContainer(
                        height: 40,
                        width: 40,
                        borderRadius: 40,
                        spread: 2,
                        primaryColor: Color(0xfff0f0f0),
                        //flat neumorphism design
                        curvature: Curvature.concave,
                        child: Icon(Icons.favorite_outline, color: Colors.red, size: 23)
                    ),
                  ),
                ],
              ),
            ),
                ],
                ),
                ),
              );
            }
}
