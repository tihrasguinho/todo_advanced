import 'package:dartz/dartz.dart';

abstract class DeleteTodoRepository {
  Future<Either<Exception, bool>> call(String id);
}
