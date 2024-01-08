import 'package:hive/hive.dart';

import '../../feature/Products/domain/entities/Products.dart';

void saveBoxData(List<ProductsModel> products,String boxName) {
  var box=Hive.box<ProductsModel>(boxName);
  box.addAll(products);
}