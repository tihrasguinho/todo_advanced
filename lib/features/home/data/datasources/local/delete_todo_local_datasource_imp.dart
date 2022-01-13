import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_advanced/core/hive/models/todo_hive.dart';
import 'package:todo_advanced/features/home/data/datasources/delete_todo_datasource.dart';

class DeleteTodoLocalDatasourceImp implements DeleteTodoDatasource {
  @override
  Future<Either<Exception, bool>> call(String id) async {
    try {
      var todos = Hive.box<TodoHive>('todos');

      if (todos.values.any((e) => e.id == id)) {
        var todo = todos.values.singleWhere((e) => e.id == id);

        todo.delete();

        return const Right(true);
      } else {
        return const Right(false);
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
