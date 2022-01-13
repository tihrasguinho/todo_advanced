import 'package:todo_advanced/features/home/data/datasources/create_todo_datasource.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/domain/repositories/create_todo_repository.dart';
import 'package:dartz/dartz.dart';

class CreateTodoRepositoryImp implements CreateTodoRepository {
  final CreateTodoDatasource _createTodoDatasource;

  CreateTodoRepositoryImp(this._createTodoDatasource);

  @override
  Future<Either<Exception, TodoEntity>> call(NewTodoEntity todo) => _createTodoDatasource(todo);
}
