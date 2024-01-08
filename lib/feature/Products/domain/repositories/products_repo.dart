import 'package:ana/feature/Products/domain/entities/Products.dart';
import 'package:dartz/dartz.dart';

import '../../../../error/Failure.dart';

abstract class ProductsRepo{
  Future<Either<Failure,List<ProductsModel>>> getAllProducts();
  Future<Either<Failure,List<ProductsModel>>> getCategory({required String category});
  Future<Either<Failure,List<String>>> getAllCategory();
}