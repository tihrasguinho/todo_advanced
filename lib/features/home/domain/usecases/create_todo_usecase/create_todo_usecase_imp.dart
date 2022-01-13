import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_advanced/features/home/domain/repositories/create_todo_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/create_todo_usecase/create_todo_usecase.dart';
import 'package:todo_advanced/core/others/string_matches.dart';

class CreateTodoUseCaseImp implements CreateTodoUseCase {
  final CreateTodoRepository _createTodoRepository;

  CreateTodoUseCaseImp(this._createTodoRepository);

  @override
  Future<Either<Exception, TodoEntity>> call(NewTodoEntity todo) async {
    if (!todo.isTitleOk) {
      return Left(Exception('Your title must be six characters or high'));
    }

    if (todo.title.containsEspecialChars) {
      return Left(Exception('Your title must not be special characters'));
    }

    if (!todo.isSubtitleOk) {
      return Left(Exception('Your subtitle must be six characters or high'));
    }

    if (todo.subtitle.containsEspecialChars) {
      return Left(Exception('Your subtitle must not be special characters'));
    }

    return await _createTodoRepository(todo);
  }
}
