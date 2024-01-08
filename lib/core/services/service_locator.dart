import 'package:ana/feature/Products/domain/use_cases/get_all_products.dart';
import 'package:ana/feature/Products/presentation/manager/products_cubit.dart';
import 'package:ana/feature/theme/domain/use_cases/set_theme_UseCase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/constants/constance.dart';
import '../../feature/Products/data/dataSource/product_local_data_source.dart';
import '../../feature/Products/data/dataSource/products_remote_data_sources.dart';
import '../../feature/Products/data/repositories/products_repo_impl.dart';
import '../../feature/Products/domain/entities/Products.dart';
import '../../feature/Products/domain/entities/Rating.dart';
import '../../feature/Products/domain/use_cases/get_all_category.dart';
import '../../feature/Products/domain/use_cases/get_category.dart';
import '../../feature/theme/data/local/data_sources/theme_local_data_sources.dart';
import '../../feature/theme/data/repositories/theme_local_data_impl.dart';
import '../../feature/theme/domain/use_cases/getTheme_UseCase.dart';
import '../../feature/theme/presentation/manager/theme_cubit.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setup() {

  getIt.registerSingletonAsync<SharedPreferences>(() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  });


  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt<Dio>()));
  //RepoImpl
  getIt.registerSingleton<ProductsRepoImpl>(ProductsRepoImpl(
    productsRemoteDataSources: ProductsRemoteDataSourcesImpl(
      getIt.get<ApiServices>(),ProductsLocalDataSourcesImpl()),
    productsLocalDataSources: ProductsLocalDataSourcesImpl(),
  ),);

  getIt.registerSingleton<ThemeRepoImpl>(ThemeRepoImpl(
    themeLocalDataSource: ThemeLocalDataSourceImpl(),
  ));
  //UseCase

  getIt.registerSingleton<GetAllProductsUseCase>(
      GetAllProductsUseCase(getIt.get<ProductsRepoImpl>()));
  getIt.registerSingleton<GetAllCategoryUseCase>(
      GetAllCategoryUseCase(getIt.get<ProductsRepoImpl>()));

  getIt.registerSingleton<GetCategoryUseCase>(
      GetCategoryUseCase(getIt.get<ProductsRepoImpl>()));

  getIt.registerSingleton<GetThemeUseCase>(GetThemeUseCase(
    themeRepo: getIt<ThemeRepoImpl>(),
  ));
  getIt.registerSingleton<SetThemeUseCase>(SetThemeUseCase(
    themeRepo: getIt<ThemeRepoImpl>(),
  ));
  //cubit
  getIt.registerSingleton<ProductsCubit>(ProductsCubit(
    getIt<GetAllCategoryUseCase>(),
    getIt<GetAllProductsUseCase>(),
    getIt<GetCategoryUseCase>(),

  ));
  getIt.registerSingleton<ThemeCubit>(ThemeCubit(
    setThemeUseCase: getIt.get<SetThemeUseCase>(),
    getThemeUseCase: getIt.get<GetThemeUseCase>(),
  ));
}

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<ProductsModel>(AppConst.kFeatureBoxProducts);
}
