import 'package:ana/config/UseCase/UseCase.dart';
import 'package:ana/feature/Products/domain/repositories/products_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../error/Failure.dart';

class GetAllCategoryUseCase extends UseCase<List<String>, NoParam> {
  final ProductsRepo productsRepo;

  GetAllCategoryUseCase(this.productsRepo);

  @override
  Future<Either<Failure, List<String>>> execute([NoParam? param]) async {
    return await productsRepo.getAllCategory();
  }
}
