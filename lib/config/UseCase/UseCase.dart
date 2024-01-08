
import 'package:dartz/dartz.dart';
import '../../error/Failure.dart';
abstract class UseCase<Type,Param>{
Future<Either<Failure,Type>> execute( [Param param]);
}
class NoParam{}