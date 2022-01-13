import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/presentation/stores/todos_store.dart';

import 'package:asuka/asuka.dart' as asuka;

class HomeController extends Disposable {
  final TodosStore _todosStore;

  HomeController(this._todosStore);

  final titleCtrl = TextEditingController();
  final subtitleCtrl = TextEditingController();

  Future deleteTodo(String id) async {
    var result = await _todosStore.deleteTodo(id);

    if (result != null) {
      asuka.removeCurrentSnackBar();

      result ? asuka.AsukaSnackbar.alert('Todo deleted!').show() : asuka.AsukaSnackbar.alert('Todo not found').show();
    }
  }

  Future addTodo({required String title, required String subtitle}) async {
    if (title.isEmpty || subtitle.isEmpty) {
      log('Todo needs a title and subtitle!');
      return;
    }

    var add = await _todosStore.addTodo(NewTodoEntity(title: title, subtitle: subtitle));

    if (add) {
      log('Added!');
      asuka.removeCurrentSnackBar();

      asuka.AsukaSnackbar.success('Todo added!').show();
    }

    titleCtrl.clear();
    subtitleCtrl.clear();

    Modular.to.pop();
  }

  Future changeStatus(String id) async {
    var result = await _todosStore.changeStatus(id);

    if (result) {
      asuka.removeCurrentSnackBar();

      asuka.AsukaSnackbar.success('Todo updated!').show();
    }
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    subtitleCtrl.dispose();
  }
}
