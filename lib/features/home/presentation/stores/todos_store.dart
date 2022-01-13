import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/domain/usecases/change_todo_status_usecase/change_todo_status_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/create_todo_usecase/create_todo_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase.dart';
import 'package:todo_advanced/features/home/presentation/states/todos_state.dart';

class TodosStore extends ValueNotifier<TodosState> {
  final FetchTodosUsecase _fetchTodosUsecase;
  final CreateTodoUseCase _createTodoUseCase;
  final ChangeTodoStatusUseCase _changeTodoStatusUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodosStore(
    this._fetchTodosUsecase,
    this._createTodoUseCase,
    this._changeTodoStatusUseCase,
    this._deleteTodoUseCase,
  ) : super(SuccessTodosState([])) {
    fetchTodos();
  }

  Future<bool> addTodo(NewTodoEntity newTodo) async {
    var result = await _createTodoUseCase(newTodo);

    if (result.isRight()) {
      var todo = result.fold((l) => null, (r) => r);

      var todos = (value as SuccessTodosState).todos;
      if (value is SuccessTodosState) {
        todos.add(todo!);

        value = SuccessTodosState(todos);
      } else {
        value = SuccessTodosState([todo!]);
      }

      return true;
    } else {
      var error = result.fold((l) => l, (r) => null);

      log(error.toString());

      return false;
    }
  }

  Future fetchTodos() async {
    value = LoadingTodosState();

    var result = await _fetchTodosUsecase();

    Future.delayed(const Duration(seconds: 2));

    if (result.isRight()) {
      var todos = result.fold((l) => null, (r) => r);

      value = SuccessTodosState(todos!);
    } else {
      var error = result.fold((l) => l, (r) => null);

      log(error.toString());
    }
  }

  Future<bool> changeStatus(String id) async {
    var result = await _changeTodoStatusUseCase(id);

    if (result.isRight()) {
      var todos = (value as SuccessTodosState).todos;

      var index = todos.indexWhere((e) => e.id == id);

      todos.removeAt(index);

      var todo = result.fold((l) => null, (r) => r);

      todos.insert(index, todo!);

      value = SuccessTodosState(todos);

      return true;
    } else {
      var error = result.fold((l) => l, (r) => null);

      log(error.toString());

      return false;
    }
  }

  Future<bool?> deleteTodo(String id) async {
    var result = await _deleteTodoUseCase(id);

    if (result.isRight()) {
      if (result.fold((l) => null, (r) => r)!) {
        var todos = (value as SuccessTodosState).todos;

        todos.removeWhere((e) => e.id == id);

        value = SuccessTodosState(todos);

        return true;
      } else {
        log('Todo not found!');

        return false;
      }
    } else {
      var error = result.fold((l) => l, (r) => null);

      log(error.toString());

      return null;
    }
  }
}
