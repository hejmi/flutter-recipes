import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_recipes/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes/data/recipes_api.dart';
import 'package:flutter_recipes/model/ingredients.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  RecipeDetails({this.recipe});

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  List<Ingredients> _ingredientsList = [];

  void getIngredientsForRecipeId(int id) async {
    RecipeApi.getIngredientsFromId(id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _ingredientsList =
            list.map((model) => Ingredients.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getIngredientsForRecipeId(widget.recipe.id);
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
                    child: Icon(Icons.favorite_outline,
                        color: Colors.red, size: 23),
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
                          return ListBody(
                            children: [
                              _ingredientsList[index].measure == null
                                  ? Text(_ingredientsList[index].ingredient,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.w400))
                                  : Text(
                                      "${_ingredientsList[index].measure} ${_ingredientsList[index].ingredient}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.w400),
                                    )
                            ],
                          );
                        }),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
