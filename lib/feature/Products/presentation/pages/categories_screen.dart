import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../manager/products_cubit.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.nameCategories});
  String nameCategories;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductsCubit>()
        ..getCategory(nameCategories),
      child: Scaffold(
        appBar: AppBar(
          title: Text(nameCategories),
          actions: [
            iconsThemeChange(),
          ],
        ),
        body: buildBlocConsumerBodyCategory(),
      ),
    );
  }

}
