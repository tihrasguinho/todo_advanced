import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

abstract class FetchTodosRepository {
  Future<Either<Exception, List<TodoEntity>>> call();
}
