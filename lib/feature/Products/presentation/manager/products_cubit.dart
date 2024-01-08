import 'package:ana/config/constants/constance.dart';
import 'package:ana/feature/Products/domain/use_cases/get_all_category.dart';
import 'package:ana/feature/Products/domain/use_cases/get_all_products.dart';
import 'package:ana/feature/Products/domain/use_cases/get_category.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/Products.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getAllCategoryUseCase, this._getAllProductsUseCase, this._getCategoryUseCase) : super(const ProductsState());
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoryUseCase _getAllCategoryUseCase;
  final GetCategoryUseCase _getCategoryUseCase;
  void getAllCategories()async{
    emit(state.copyWith(getAllCategoriesState: Status.loading,));
    final result= await _getAllCategoryUseCase.execute();
   result.fold((l)  {
     emit(state.copyWith(getAllCategoriesState: Status.error,msg: l.messageError));

   }, (r)  {
     emit(state.copyWith(getAllCategoriesState: Status.success,categoriesList: r,msg: "نجح"));

   });
  }




  void getAllProducts()async{

    emit(state.copyWith(getAllProductsState: Status.loading,),);
    final result= await _getAllProductsUseCase.execute();
   result.fold((l)  {
     emit(state.copyWith(getAllProductsState: Status.error,msg: l.messageError));
   }, (r)  {
     emit(state.copyWith(getAllProductsState: Status.success,products: r,msg: "نجح"),);
   });
  }

  void getCategory(String category)async{

    emit(state.copyWith(getAllProductsState: Status.loading,));
    final result= await _getCategoryUseCase.execute(category);
   result.fold((l)  {
     emit(state.copyWith(getAllProductsState: Status.error,msg: l.messageError));
     print(l.messageError);
     print("4513330");
   }, (r)  {
     emit(state.copyWith(getAllProductsState: Status.success,categories: r,msg: "نجح"));
print(state.categories.length);

   });
  }
}
