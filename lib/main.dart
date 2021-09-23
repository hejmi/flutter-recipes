import 'package:flutter_recipes/screens/recipes_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The Recipe Cave",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: RecipesList(),
    );
  }
}
