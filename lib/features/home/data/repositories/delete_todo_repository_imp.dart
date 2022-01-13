import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/data/datasources/delete_todo_datasource.dart';
import 'package:todo_advanced/features/home/domain/repositories/delete_todo_repository.dart';

class DeleteTodoRepositoryImp implements DeleteTodoRepository {
  final DeleteTodoDatasource _deleteTodoDatasource;

  DeleteTodoRepositoryImp(this._deleteTodoDatasource);

  @override
  Future<Either<Exception, bool>> call(String id) async => _deleteTodoDatasource(id);
}
