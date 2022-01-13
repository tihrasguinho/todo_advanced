import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';

abstract class TodosState {}

class SuccessTodosState implements TodosState {
  final List<TodoEntity> todos;

  SuccessTodosState(this.todos);
}

class LoadingTodosState implements TodosState {}

class ErrorTodosState implements TodosState {
  final String error;

  ErrorTodosState(this.error);
}
