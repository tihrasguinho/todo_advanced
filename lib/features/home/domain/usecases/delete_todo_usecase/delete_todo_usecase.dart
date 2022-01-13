import 'package:dartz/dartz.dart';

abstract class DeleteTodoUseCase {
  Future<Either<Exception, bool>> call(String id);
}
