import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_advanced/core/hive/models/todo_hive.dart';
import 'package:todo_advanced/features/home/data/datasources/fetch_todos_datasource.dart';
import 'package:todo_advanced/features/home/data/odts/todo_odt.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

class FetchTodosLocalDatasourceImp implements FetchTodosDatasource {
  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    try {
      var app = Hive.box<TodoHive>('todos');

      var todos = app.values.map((e) => TodoOdt.fromMap(e.toMap())).toList();

      return Right(todos);
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
