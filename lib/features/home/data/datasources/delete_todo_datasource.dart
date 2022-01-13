import 'package:dartz/dartz.dart';

abstract class DeleteTodoDatasource {
  Future<Either<Exception, bool>> call(String id);
}
