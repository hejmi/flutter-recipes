class Steps {
  int id;
  int step;
  String description;

  Steps.fromJson(Map json)
      : id = json['id'],
        step = json['step'],
        description = json['description'];

  Map toJson() {
    return {'id': id, 'step': step, 'description': description};
  }
}
