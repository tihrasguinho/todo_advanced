import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/data/datasources/fetch_todos_datasource.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/repositories/fetch_todos_repository.dart';

class FetchTodosRepositoryImp implements FetchTodosRepository {
  final FetchTodosDatasource _fetchTodosDatasource;

  FetchTodosRepositoryImp(this._fetchTodosDatasource);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() => _fetchTodosDatasource();
}
