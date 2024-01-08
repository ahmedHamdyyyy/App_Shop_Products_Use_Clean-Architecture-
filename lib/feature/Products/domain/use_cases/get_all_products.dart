import 'package:ana/config/UseCase/UseCase.dart';
import 'package:ana/feature/Products/domain/repositories/products_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../error/Failure.dart';
import '../entities/Products.dart';

class GetAllProductsUseCase extends UseCase<List<ProductsModel>,NoParam>{
  final ProductsRepo productsRepo;

   GetAllProductsUseCase(this.productsRepo);

  @override
  Future<Either<Failure, List<ProductsModel>>> execute( [NoParam? param])async
  => await productsRepo.getAllProducts() ;

}