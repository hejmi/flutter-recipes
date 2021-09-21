import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    return http.get("http://localhost:3002/api/get");
  }
}
