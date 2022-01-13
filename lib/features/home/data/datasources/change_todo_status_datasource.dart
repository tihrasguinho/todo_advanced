import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

abstract class ChangeTodoStatusDatasource {
  Future<Either<Exception, TodoEntity>> call(String id);
}
