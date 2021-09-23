import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_recipes/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes/data/recipes_api.dart';
import 'package:flutter_recipes/model/ingredients.dart';
import 'package:flutter_recipes/model/steps.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  RecipeDetails({this.recipe});

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  List<Ingredients> _ingredientsList = [];
  List<Steps> _stepsList = [];

  void getIngredientsForRecipeId(int id) async {
    RecipeApi.getIngredientsFromId(id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _ingredientsList =
            list.map((model) => Ingredients.fromJson(model)).toList();
      });
    });
  }

  void getStepsForRecipeId(int id) async {
    RecipeApi.getStepsFromId(id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _stepsList = list.map((model) => Steps.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getIngredientsForRecipeId(widget.recipe.id);
    getStepsForRecipeId(widget.recipe.id);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14));
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  FlutterIcons.info_faw5s,
                  size: 15,
                ),
              ),
              Tab(
                icon: Icon(
                  FlutterIcons.file_signature_faw5s,
                  size: 15,
                ),
              ),
              Tab(
                icon: Icon(
                  FlutterIcons.blender_faw5s,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "UniSans"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    widget.recipe.description,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  ),
                  Material(
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blueGrey,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            size: 15,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "UniSans"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Expanded(
                    child: new ListView.builder(
                        itemCount: _ingredientsList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                flex: 25,
                                child: _ingredientsList[index].measure == null
                                    ? Text("",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.w400,
                                        ))
                                    : Text(
                                        _ingredientsList[index].measure,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w400),
                                      ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Expanded(
                                flex: 75,
                                child: Text(_ingredientsList[index].ingredient,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          );
                        }),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: const Text('Add all ingredients to shopping list'),
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
                    "Step by step",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "UniSans"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Expanded(
                    child: new ListView.builder(
                        itemCount: _stepsList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "${_stepsList[index].step}. ${_stepsList[index].description} \n",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          );
                        }),
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
