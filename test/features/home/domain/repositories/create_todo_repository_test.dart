import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_advanced/core/others/string_generator.dart';
import 'package:todo_advanced/features/home/data/datasources/create_todo_datasource.dart';
import 'package:todo_advanced/features/home/data/repositories/create_todo_repository_imp.dart';
import 'package:todo_advanced/features/home/domain/entities/new_todo_entity.dart';
import 'package:todo_advanced/features/home/domain/entities/todo_entity.dart';
import 'package:todo_advanced/features/home/domain/repositories/create_todo_repository.dart';

class CreateTodoDatasourceMock extends Mock implements CreateTodoDatasource {}

void main() {
  CreateTodoDatasource datasource = CreateTodoDatasourceMock();
  CreateTodoRepository repository = CreateTodoRepositoryImp(datasource);

  final todo = NewTodoEntity(title: 'title', subtitle: 'subtitle');

  test('Should return a valid todo', () async {
    when(() => datasource(todo)).thenAnswer(
      (_) async => Right(
        TodoEntity(
          id: StringGenerator.generateRandomString(6),
          owner: StringGenerator.generateRandomString(6),
          title: StringGenerator.generateRandomString(6),
          subtitle: StringGenerator.generateRandomString(6),
          done: false,
          time: DateTime.now().toUtc().millisecondsSinceEpoch,
        ),
      ),
    );

    var result = await repository(todo);

    expect(result, isA<Either>());
    expect(result.fold((l) => null, (r) => r), isNotNull);
    expect(result.fold((l) => null, (r) => r)!.id.length, greaterThanOrEqualTo(6));
    expect(result.fold((l) => null, (r) => r)!.title.length, greaterThanOrEqualTo(6));
    expect(result.fold((l) => null, (r) => r)!.subtitle.length, greaterThanOrEqualTo(6));
    expect(result.fold((l) => null, (r) => r)!.done, equals(false));
  });
}
