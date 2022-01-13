import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_advanced/core/others/string_generator.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/repositories/fetch_todos_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase_imp.dart';

class FetchTodosRepositoryMock extends Mock implements FetchTodosRepository {}

void main() {
  FetchTodosRepository repository = FetchTodosRepositoryMock();
  FetchTodosUsecase usecase = FetchTodosUsecaseImp(repository);

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
    when(() => repository()).thenAnswer((_) async => Right(data));

    final result = await usecase();

    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<List<TodoEntity>>());
    expect(result.fold((l) => null, (r) => r)!.length, equals(3));
    verify(repository);
  });
}
