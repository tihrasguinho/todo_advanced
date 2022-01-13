import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

abstract class CreateTodoRepository {
  Future<Either<Exception, TodoEntity>> call(NewTodoEntity todo);
}
