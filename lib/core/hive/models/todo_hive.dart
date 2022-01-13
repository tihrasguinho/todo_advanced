import 'dart:convert';

import 'package:hive/hive.dart';

part 'todo_hive.g.dart';

@HiveType(typeId: 0)
class TodoHive extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  String owner;

  @HiveField(4)
  bool done;

  @HiveField(5)
  int time;

  TodoHive({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.owner,
    required this.done,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'owner': owner,
      'done': done,
      'time': time,
    };
  }

  factory TodoHive.fromMap(Map<String, dynamic> map) {
    return TodoHive(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      owner: map['owner'] ?? '',
      done: map['done'] ?? false,
      time: map['time']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoHive.fromJson(String source) => TodoHive.fromMap(json.decode(source));
}
