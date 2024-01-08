import 'package:hive/hive.dart';

import '../../../../config/constants/constance.dart';
part 'Rating.g.dart';


@HiveType(typeId: 1)
class Rating {
  @HiveField(0)
  final num rate;
  @HiveField(1)
  final num count;

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
        rate: json[AppConst.rate] as num,
        count: json[AppConst.count] as num,
      );

  Map<String, dynamic> toJson() => {
        AppConst.rate: rate,
        AppConst.count: count,
      };
}