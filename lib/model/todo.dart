class Todo {
  int? id;
  String name;
  String description;
  int done;

  Todo(
    this.id,
    this.name,
    this.description,
    this.done,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'done': done,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(map['id'], map['name'], map['description'], map['done']);
  }
}
