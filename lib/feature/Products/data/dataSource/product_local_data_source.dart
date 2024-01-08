import 'dart:convert';

import 'package:ana/config/constants/constance.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/Products.dart';
abstract class ProductsLocalDataSources {
  List<ProductsModel> getAllProducts();
  List<ProductsModel> getCategory({required String category});
  Future<void> cachGetCategory(List<ProductsModel> categories);
}

class ProductsLocalDataSourcesImpl extends ProductsLocalDataSources {
  @override
  List<ProductsModel> getAllProducts() {
    var box = Hive.box<ProductsModel>(AppConst.kFeatureBoxProducts);
    return box.values.toList();
  }

  @override
  Future<void> cachGetCategory(List<ProductsModel> categories) async {
    final jsonString = jsonEncode(
        categories.map((category) => category.toJson()).toList());
    await getIt<SharedPreferences>().
    setString(AppConst.categories, jsonString);
  }


  @override
  List<ProductsModel> getCategory({required String category})  {
    final jsonString = getIt<SharedPreferences>().getString(AppConst.categories);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final categories = jsonList.map((json) => ProductsModel.fromJson(json))
          .toList();
      return categories;
    }
    return []; // Return an empty list if no data is found in SharedPreferences
  }
  }
