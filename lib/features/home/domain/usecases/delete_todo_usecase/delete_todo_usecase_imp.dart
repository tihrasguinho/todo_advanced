import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/repositories/delete_todo_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/delete_todo_usecase/delete_todo_usecase.dart';

class DeleteTodoUseCaseImp implements DeleteTodoUseCase {
  final DeleteTodoRepository _deleteTodoRepository;

  DeleteTodoUseCaseImp(this._deleteTodoRepository);

  @override
  Future<Either<Exception, bool>> call(String id) async => _deleteTodoRepository(id);
}
