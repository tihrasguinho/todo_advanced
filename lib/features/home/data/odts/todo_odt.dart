import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

extension TodoOdt on TodoEntity {
  static TodoEntity fromMap(Map data) {
    return TodoEntity(
      id: data['id'],
      owner: data['owner'],
      title: data['title'],
      subtitle: data['subtitle'],
      done: data['done'],
      time: data['time'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'owner': owner,
        'title': title,
        'subtitle': subtitle,
        'done': done,
        'time': time,
      };
}
