import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_advanced/core/others/string_generator.dart';
import 'package:todo_advanced/features/home/data/datasources/fetch_todos_datasource.dart';
import 'package:todo_advanced/features/home/data/repositories/fetch_todos_repository_imp.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/repositories/fetch_todos_repository.dart';

class FetchTodosDatasourceMock extends Mock implements FetchTodosDatasource {}

void main() {
  FetchTodosDatasource datasource = FetchTodosDatasourceMock();
  FetchTodosRepository repository = FetchTodosRepositoryImp(datasource);

  final data = [
    TodoEntity(
      id: StringGenerator.generateRandomString(5),
      owner: StringGenerator.generateRandomString(5),
      title: StringGenerator.generateRandomString(5),
      subtitle: StringGenerator.generateRandomString(5),
      done: false,
      time: 0,
    ),
    TodoEntity(
      id: StringGenerator.generateRandomString(5),
      owner: StringGenerator.generateRandomString(5),
      title: StringGenerator.generateRandomString(5),
      subtitle: StringGenerator.generateRandomString(5),
      done: false,
      time: 0,
    ),
    TodoEntity(
      id: StringGenerator.generateRandomString(5),
      owner: StringGenerator.generateRandomString(5),
      title: StringGenerator.generateRandomString(5),
      subtitle: StringGenerator.generateRandomString(5),
      done: false,
      time: 0,
    ),
  ];

  test('Should return a todo list with 3 items', () async {
    when(() => datasource()).thenAnswer((_) async => Right(data));

    var result = await repository();

    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<List<TodoEntity>>());
    expect(result.fold((l) => null, (r) => r)!.length, equals(3));
    verify(datasource);
  });
}
