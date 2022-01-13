import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_advanced/core/hive/models/todo_hive.dart';
import 'package:todo_advanced/features/home/data/datasources/change_todo_status_datasource.dart';
import 'package:todo_advanced/features/home/data/odts/todo_odt.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

class ChangeTodoStatusLocalDatasourceImp implements ChangeTodoStatusDatasource {
  @override
  Future<Either<Exception, TodoEntity>> call(String id) async {
    try {
      var todos = Hive.box<TodoHive>('todos');

      if (todos.values.any((e) => e.id == id)) {
        var todo = todos.values.singleWhere((e) => e.id == id);
        todo.done = !todo.done;
        todo.save();

        return Right(TodoOdt.fromMap(todo.toMap()));
      } else {
        return Left(Exception('Todo not found!'));
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
