import 'dart:async';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future getRecipes() {
    return http.get("http://localhost:3002/api/get");
  }
}
