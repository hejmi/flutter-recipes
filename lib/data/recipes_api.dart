import 'dart:async';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future getRecipes() {
    return http.get("http://localhost:3002/api/get");
  }
  static Future getSingleRecipe(int id) {
    return http.get("http://localhost:3002/api/getFromId/$id");
  }
  static Future getIngredientsFromId(int id) {
    return http.get("http://localhost:3002/api/getIngredientsFromId/$id");
  }
  static Future getStepsFromId(int id) {
    return http.get("http://localhost:3002/api/getStepsFromId/$id");
  }
}
