import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_advanced/core/hive/models/todo_hive.dart';
import 'package:todo_advanced/core/others/string_generator.dart';
import 'package:todo_advanced/features/home/data/datasources/create_todo_datasource.dart';
import 'package:todo_advanced/features/home/data/odts/todo_odt.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';

class CreateTodoLocalDatasourceImp implements CreateTodoDatasource {
  @override
  Future<Either<Exception, TodoEntity>> call(NewTodoEntity todo) async {
    try {
      var todos = Hive.box<TodoHive>('todos');

      final result = TodoEntity(
        id: StringGenerator.generateRandomString(16),
        owner: StringGenerator.generateRandomString(8),
        title: todo.title,
        subtitle: todo.subtitle,
        done: false,
        time: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

      if (!todos.values.any((e) => e.id == result.id)) {
        todos.add(TodoHive.fromMap(result.toMap()));
      }

      return Right(result);
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
