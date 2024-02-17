import 'dart:convert';

List<Todos> todosFromJson(String str) => List<Todos>.from(json
    .decode(str)
    .map((x) => x is Map<String, dynamic> ? Todos.fromJson(x) : Todos()));

String todosToJson(List<Todos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todos {
  String? id;
  String? title;
  bool? completed;
  int? priority;
  DateTime? dueDate;

  Todos({
    this.id,
    this.title,
    this.completed,
    this.priority,
    this.dueDate,
  });

  factory Todos.fromJson(Map<String, dynamic> json, {bool isLocal = false}) =>
      Todos(
        id: json["id"].toString(),
        title: json["title"],
        completed: isLocal
            ? json["completed"] == 0
                ? false
                : true
            : json["completed"],
        priority: json["priority"],
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
      );

  Map<String, dynamic> toJson({bool isLocal = false}) => {
        "title": title,
        "completed": isLocal
            ? (completed ?? false)
                ? 1
                : 0
            : completed,
        "priority": priority,
        "dueDate": dueDate?.toIso8601String(),
      };
}
