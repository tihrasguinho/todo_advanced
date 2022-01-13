import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/repositories/change_todo_status_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/change_todo_status_usecase/change_todo_status_usecase.dart';

class ChangeTodoStatusUseCaseImp implements ChangeTodoStatusUseCase {
  final ChangeTodoStatusRepository _changeTodoStatusRepository;

  ChangeTodoStatusUseCaseImp(this._changeTodoStatusRepository);

  @override
  Future<Either<Exception, TodoEntity>> call(String id) async => _changeTodoStatusRepository(id);
}
