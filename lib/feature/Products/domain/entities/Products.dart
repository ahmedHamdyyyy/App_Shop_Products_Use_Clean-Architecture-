import 'package:ana/config/constants/constance.dart';
import 'package:ana/feature/Products/domain/entities/Rating.dart';
import 'package:hive_flutter/adapters.dart';
part 'Products.g.dart';

@HiveType(typeId: 0)
class ProductsModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final Rating rating;

  const ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json[AppConst.id],
        title: json[AppConst.title],
        price: json[AppConst.price]?.toDouble(),
        description: json[AppConst.description],
        category: json[AppConst.category],
        image: json[AppConst.image],
        rating: Rating.fromJson(json[AppConst.rating]),
      );

  Map<String, dynamic> toJson() {
    return {
      AppConst.id: id,
      AppConst.title: title,
      AppConst.price: price,
      AppConst.description: description,
      AppConst.category: category,
      AppConst.image: image,
      AppConst.rating: rating,
    };
  }
}

/*class Rating {

  final double rate;

  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json[AppConst.rate]?.toDouble(),
        count: json[AppConst.count],
      );

  Map<String, dynamic> toJson() => {
        AppConst.rate: rate,
        AppConst.count: count,
      };
}*/
