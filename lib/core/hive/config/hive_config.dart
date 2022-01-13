import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_advanced/core/hive/models/todo_hive.dart';

class HiveConfig {
  static Future init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TodoHiveAdapter());

    await Hive.openBox<TodoHive>('todos');

    await Hive.openBox('app');
  }
}
