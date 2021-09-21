class Character {
  int id;
  String title;
  String description;
  int cookingtime;
  int preptime;

  Character.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        cookingtime = json['cooking_time'],
        preptime = json['prep_time'];

  Map toJson() {
    return {'id': id, 'title': title, 'description': description, 'cookingtime': cookingtime, 'preptime': preptime};
  }
}
