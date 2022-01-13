import 'package:todo_advanced/features/home/data/datasources/change_todo_status_datasource.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/repositories/change_todo_status_repository.dart';

class ChangeTodoStatusRepositoryImp implements ChangeTodoStatusRepository {
  final ChangeTodoStatusDatasource _changeTodoStatusDatasource;

  ChangeTodoStatusRepositoryImp(this._changeTodoStatusDatasource);

  @override
  Future<Either<Exception, TodoEntity>> call(String id) async => _changeTodoStatusDatasource(id);
}
