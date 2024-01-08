import 'package:ana/config/UseCase/UseCase.dart';
import 'package:ana/feature/Products/domain/repositories/products_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../error/Failure.dart';
import '../entities/Products.dart';

class GetCategoryUseCase extends UseCase<List<ProductsModel>,String>{
  final ProductsRepo productsRepo;

  GetCategoryUseCase(this.productsRepo);

  @override
  Future<Either<Failure, List<ProductsModel>>> execute( [String? param]) async {
    return  await productsRepo.getCategory(category: param! );
  }


}