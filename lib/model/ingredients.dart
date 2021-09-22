class Ingredients {
  int id;
  String measure;
  String ingredient;

  Ingredients.fromJson(Map json)
      : id = json['id'],
        measure = json['measure'],
        ingredient = json['ingredient'];

  Map toJson() {
    return {'id': id, 'measure': measure, 'ingredient': ingredient};
  }
}
