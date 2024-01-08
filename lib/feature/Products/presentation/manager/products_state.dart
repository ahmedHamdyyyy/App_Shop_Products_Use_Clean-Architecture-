part of 'products_cubit.dart';

class ProductsState extends Equatable {
  final String msg;
  final List<ProductsModel> products;
  final List<ProductsModel> categories;
  final List<String> categoriesList;
  final Status getAllProductsState;
  final Status getAllCategoriesState;

  const ProductsState({
    this.msg = "",
    this.products = const [],
    this.categoriesList = const [],
    this.categories = const [],
    this.getAllProductsState = Status.initial,
    this.getAllCategoriesState = Status.initial,
  });

  ProductsState copyWith({
    String? msg,
    List<ProductsModel>? products,
    List<ProductsModel>? categories,
    List<String>? categoriesList,
    Status? getAllProductsState,
    Status? getAllCategoriesState,
  }) {
    return ProductsState(
      msg: msg ?? this.msg,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
      categoriesList: categoriesList ?? this.categoriesList,
      getAllProductsState: getAllProductsState ?? this.getAllProductsState,
    );
  }

  @override
  List<Object> get props => [
        msg,
        products,
    categories,
        categoriesList,
        getAllProductsState,
        getAllCategoriesState,
      ];
}
