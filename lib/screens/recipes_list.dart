import 'dart:convert';
import 'package:flutter_recipes/data/recipes_api.dart';
import 'package:flutter_recipes/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes/screens/recipe_details.dart';

class RecipesList extends StatefulWidget {
  RecipesList({Key key}) : super(key: key);

  @override
  _RecipesListState createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  List<Recipe> _recipesList = [];

  void getRecipesFromApi() async {
    RecipeApi.getRecipes().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _recipesList = list.map((model) => Recipe.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Flutter Recipes"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _recipesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Color(0x00795548),
                  hoverColor: Color(0x99795548),
                  minVerticalPadding: 10,
                  title: Text(_recipesList[index].title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "UniSans")),
                  subtitle: Text(_recipesList[index].description,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w400)),
                  trailing: Container(
                      width: 45,
                      height: 25,
                      alignment: Alignment.centerRight,
                      child: Row(children: <Widget>[
                        Icon(
                          Icons.timer_sharp,
                          size: 17,
                        ),
                        Expanded(
                            child: Text(
                                _recipesList[index].cookingtime.toString() +
                                    " min.",
                                style: TextStyle(fontSize: 12))),
                      ])),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/" +
                        _recipesList[index].id.toString() +
                        ".jpg"),
                    radius: 30,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetails(recipe: _recipesList[index])),
                    );
                  },
                );
              }),
        ));
  }
}
