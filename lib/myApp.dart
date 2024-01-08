import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/themApp.dart';
import 'core/services/service_locator.dart';
import 'feature/Products/presentation/manager/products_cubit.dart';
import 'feature/Products/presentation/pages/homeScreen.dart';
import 'feature/theme/presentation/manager/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeCubit>()..getTheme(),
        ),
        BlocProvider.value(
          value: getIt<ProductsCubit>()..getAllProducts()..getAllCategories(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'shop',
            theme: Themes().theme(state.theme),
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}