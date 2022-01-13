import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/repositories/fetch_todos_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase.dart';

class FetchTodosUsecaseImp implements FetchTodosUsecase {
  final FetchTodosRepository _fetchTodosRepository;

  FetchTodosUsecaseImp(this._fetchTodosRepository);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() => _fetchTodosRepository();
}
