import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/constance.dart';
import '../../../../config/widget/widget.dart';
import '../../../../core/services/service_locator.dart';
import '../../../theme/presentation/manager/theme_cubit.dart';
import '../manager/products_cubit.dart';
import 'listCaregory.dart';
import 'list_products.dart';

Column loading() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}
BlocBuilder<ThemeCubit, ThemeState> iconsThemeChange() {
  return BlocBuilder<ThemeCubit, ThemeState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
            onPressed: () {
              getIt<ThemeCubit>().setTheme(state.theme);
            },
            icon: const Icon(
              Icons.dark_mode_outlined,
              size: 40,
            )),
      );
    },
  );
}
BlocConsumer<ProductsCubit, ProductsState> buildBlocConsumerBodyHomeProducts() {
  return BlocConsumer<ProductsCubit, ProductsState>(
    listener: (context, state) => state.getAllProductsState == Status.error
        ? showToast(text: state.msg, stute: ToustStute.warning)
        : null,
    builder: (context, state) {
      return state.getAllProductsState == Status.loading
          ? loading()
          : ListProducts(state: state);
    },
  );
}

BlocConsumer<ProductsCubit, ProductsState> buildBlocConsumerBodyCategory() {
  return BlocConsumer<ProductsCubit, ProductsState>(
    listener: (context, state) => state.getAllProductsState == Status.error
        ? showToast(text: state.msg, stute: ToustStute.warning)
        : null,
    builder: (context, state) {
      return state.getAllProductsState == Status.loading
          ? loading()
          : ListCategory(state: state);
    },
  );
}
