import 'package:ana/config/constants/api_constance.dart';
import 'package:ana/config/constants/constance.dart';
import 'package:ana/core/services/api_services.dart';
import 'package:dio/dio.dart';

import '../../../../config/widget/functions.dart';
import '../../domain/entities/Products.dart';
import 'product_local_data_source.dart';

abstract class ProductsRemoteDataSources {
  Future<List<ProductsModel>> getAllProducts();
  Future<List<ProductsModel>> getCategory({required String category});
  Future<List<String>> getAllCategory();
}

class ProductsRemoteDataSourcesImpl extends ProductsRemoteDataSources {
  final ApiServices apiService;
 final ProductsLocalDataSourcesImpl productsLocalDataSourcesImpl;

  ProductsRemoteDataSourcesImpl(this.apiService, this.productsLocalDataSourcesImpl);
  @override
  Future<List<String>> getAllCategory() async {
    final response = await apiService.dio.get(ApiConstance.categories);
    List<String> categories = getAllCategoriesList(response);
    return categories;
  }


  @override
  Future<List<ProductsModel>> getAllProducts() async {
    final response = await apiService.dio.get(ApiConstance.products);
    List<ProductsModel> products = getListProducts(response);
    saveBoxData(products,AppConst.kFeatureBoxProducts);

    return products;
  }




  @override
  Future<List<ProductsModel>> getCategory({required String category}) async {
    final response =
        await apiService.dio.get(ApiConstance.getCategories(category));
    List<ProductsModel> productsCategory = getCategoryProduct(response);
    productsLocalDataSourcesImpl.cachGetCategory(productsCategory);
    return productsCategory;
  }



  List<ProductsModel> getListProducts(Response<dynamic> response) {
    List<ProductsModel>  products = [];
    for (var product in response.data) {
      products.add(ProductsModel.fromJson(product));
    }
    return products;
  }
  List<String> getAllCategoriesList(Response<dynamic> response) {
    List<String> categories = [];
    for (var category in response.data) {
      categories.add(category);
    }
    return categories;
  }
  List<ProductsModel> getCategoryProduct(Response<dynamic> response) {
    List<ProductsModel> productsCategory = [];
    for (var category in response.data) {
      productsCategory.add(ProductsModel.fromJson(category));
    }
    return productsCategory;
  }

}
