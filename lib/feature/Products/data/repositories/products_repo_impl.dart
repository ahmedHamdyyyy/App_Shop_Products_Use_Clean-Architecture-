import 'dart:convert';

import 'package:ana/core/services/service_locator.dart';
import 'package:ana/error/Failure.dart';
import 'package:ana/feature/Products/data/dataSource/product_local_data_source.dart';
import 'package:ana/feature/Products/data/dataSource/products_remote_data_sources.dart';

import 'package:ana/feature/Products/domain/entities/Products.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../domain/repositories/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsLocalDataSources productsLocalDataSources;
  final ProductsRemoteDataSources productsRemoteDataSources;

  ProductsRepoImpl({
    required this.productsLocalDataSources,
    required this.productsRemoteDataSources,
  });
  @override
  Future<Either<Failure, List<String>>> getAllCategory() async {
    try {
      /*    final productsList= productsLocalDataSources.getAllCategory();
      if(productsList.isNotEmpty){
        return right(productsList);
      }*/
      final result = await productsRemoteDataSources.getAllCategory();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        //print(e.toString());
        return left(ServerFailure.fromDioError(e));
      } else {
        debugPrint(e.toString());
        return left(ServerFailure(messageError: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts() async {
    try {
      final productsList = productsLocalDataSources.getAllProducts();
      if (productsList.isNotEmpty) {
        return right(productsList);
      }
      final result = await productsRemoteDataSources.getAllProducts();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        //print(e.toString());
        return left(ServerFailure.fromDioError(e));
      } else {
        debugPrint(e.toString());
        return left(ServerFailure(messageError: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> getCategory(
      {required String category}) async {
    try {
      final productsList = productsLocalDataSources.getCategory(category: category);
      if (productsList.any((element) => element.category==category)) {
        return right(productsList);
      }
      final result = await productsRemoteDataSources.getCategory(category: category);
      await productsLocalDataSources.cachGetCategory(result);
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      debugPrint(e.toString());
      return left(ServerFailure(messageError: e.toString()));
    }
  }

  @override
  Future<void> cachGetCategory(List<ProductsModel> categories) {
    // TODO: implement cachGetCategory
    throw UnimplementedError();
  }






}
